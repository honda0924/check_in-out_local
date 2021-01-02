class IosController < ApplicationController
  def new
    @io=Io.new
  end
  def create
    if params[:check_in]
      
    elsif params[:check_out]
      
    end
  end
end
