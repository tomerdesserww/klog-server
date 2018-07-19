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
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_REGION']
    )

    s3 = Aws::S3::Resource.new(client: aws_client)
    bucket = s3.bucket('klog-complaint-images')
    obj = bucket.object("#{params[:filename]}")

    url = obj.presigned_url(:put, acl: 'public-read', expires_in: 3600 * 24 * 7)

    render json: { uploadUrl: url }
  end

  def reply
    complaint = Complaint.find(params[:id])
    complaint.update!(response: params[:message])
    #PAZZZ GIVE ME AN ENDPOINT TO SENT THE RESPONSE TO
    Telegram.bot.send_message(chat_id: complaint.session_id, text: "This is the reply to your last complaint: \"#{complaint.response}\"")

    render json: {}
  end
end
