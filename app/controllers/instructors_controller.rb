class InstructorsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!
    before_action :set_instructor, only: [:show, :edit, :update, :destroy]

    def index
        @instructors = Instructor.sorted
    end

    def show
    end

    def new
        @instructor = Instructor.new
    end

    def create
        @instructor = Instructor.create(instructor_params)
    end

    def edit
    end

    def update
        @instructor.update(instructor_params)
    end

    def destroy
        @instructor.destroy
    end

    private
        def set_instructor
            @instructor = Instructor.find(params[:id])
        end
        def instructor_params
            params.require(:instructor).permit(:first_name, :last_name, :salary, :age, :education, :user_id)
        end
end
