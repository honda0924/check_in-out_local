class LineusersController < ApplicationController
  def new
    @lineuser = Lineuser.new()
  end
  def create
    @lineuser = Lineuser.create(lineuser_params)
    redirect_to messages_path
  end

  private
  def lineuser_params
    params.require(:lineuser).permit(:line_uid, :line_name, :student_id)
  end
end
