class IostatesController < ApplicationController
  def index
    @iostate=Iostate.where(id: params[:ios_student_id])
  end
end
