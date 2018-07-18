class Api::V1::ComplaintController < ApplicationController
  def index
    render json: Complaint.all
  end

  def show
    render json: Complaint.find(params[:id])
  end

  def create
    render json: Complaint.create!(params.permit(:name, :text, :asset_url, :session_id))
  end

  def update
    render json: Complaint.find(params[:id]).update!(params.permit(:name, :text, :asset_url, :session_id))
  end

  def generate_upload_url
    aws_client = Aws::S3::Client.new(

      access_key_id: 'AKIAISSNN4TZKU75URGQ',
      secret_access_key: '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'
    )

    s3 = Aws::S3::Resource.new(client: aws_client)
    bucket = s3.bucket('klog-complaint-images')
    obj = bucket.object("#{params[:filename]}")

    url = obj.presigned_url(:put)

    render json: { uploadUrl: url }
  end
end
