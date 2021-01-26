class StudentsController < ApplicationController
    def index
       @students=Student.all 
    end
    def new
        @student = Student.new
    end
    def create
        Student.create(student_params)
        redirect_to root_path
    end

    private
    def student_params
        params.require(:student).permit(:student_name,:student_class,:parent_name,:student_enabled)
    end 
end
