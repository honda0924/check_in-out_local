class IosController < ApplicationController
  def new
    @io=Io.new
    gon.line_token = Rails.application.credentials.line[:channel_token]
  end
  def create
    # @io = Io.new
    # if @io.save
    #   respond_to do |format|
    #     format.html
    #     format.json
    #   end
    
    # end
  end
  private
  def ios_params
  end
end
