class Api::V1::TestController < ApplicationController
  def index
    render json: { test: 'hi' }
  end
end
