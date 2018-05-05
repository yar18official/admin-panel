class StudentsController < ApplicationController
    def index
        @students = Student.sorted
    end
    
    def show
        @student = Student.find(params[:id])
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            redirect_to(student_path)
        else
            render('new')
        end
    end

    def edit
    end

    def update
    end

    def delete
    end

    def destroy
    end
    
    private

    def student_params
        params.require(:student).permit(:first_name, :last_name, :cohort, :age, :education, :email, :phone_number)
    end
end
