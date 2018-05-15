class StudentsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!
    before_action :set_student, only: [:show, :edit, :update, :destroy]

    def index
        @students = Student.sorted
    end

    def show
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.create(student_params)
    end

    def edit
    end

    def update
        @student.update(student_params)
    end

    def destroy
        @student.destroy
    end

    private
        def set_student
            @student = Student.find(params[:id])
        end

        def student_params
            params.require(:student).permit(:first_name, :last_name, :cohort_id, :age, :education)
        end
end
