class StudentsController < ApplicationController
    def index
    #    @students=Student.where(id: params[:ios_student_id].to_i)
        @students=Student.all
    end
    def new
        @student = Student.new
    end
    def create
        Student.create(student_params)
        redirect_to root_path
    end
    def destroy
        student = Student.find(params[:id])
        student.destroy
        redirect_to root_path
    end

    private
    def student_params
        params.require(:student).permit(:student_name,:student_class,:parent_name,:student_enabled)
    end 
end
