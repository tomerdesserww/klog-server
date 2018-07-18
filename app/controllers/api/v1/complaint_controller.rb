class Api::V1::ComplaintController < ApplicationController
  def index
    render json: Complaint.all
  end

  def show
    render json: Complaint.find(params[:id])
  end

  def create
    render json: Complaint.create!(text: params[:text], image_url: params[:image_url], session_id: params[:session_id])
  end

  def update
    render json: Complaint.find(params[:id]).update!(params.permit(:text, :image_url, :session_id))
  end

  def generate_upload_url(filename)
    aws_client = Aws::S3::Client.new(
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    )

    s3 = Aws::S3::Resource.new(client: aws_client)
    bucket = s3.bucket('bucket-name')
    obj = bucket.object("#{filename}")

    url = obj.presigned_url(:put)

    render json: url
  end
end
