class IostatesController < ApplicationController
  def index
    @iostates=Iostate.where(student_id: params[:ios_student_id].to_i)
  end
end
