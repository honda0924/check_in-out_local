class IosController < ApplicationController
  def new
    @io=Io.new
  end
  def create
    @io = Io.new
    if @io.save
      respond_to do |format|
        format.html
        format.json
      end
    
    end
  end
  private
  def ios_params
end
