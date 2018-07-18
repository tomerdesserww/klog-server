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
end
