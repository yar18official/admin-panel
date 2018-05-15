class CoursesController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!
    before_action :set_course, only: [:show, :edit, :update, :destroy]

    def index
        @courses = Course.sorted
    end

    def show
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.create(course_params)
    end

    def edit
    end

    def update
        @course.update(course_params)
    end

    def destroy
        @course.destroy
    end

    private
        def set_course
            @course = Course.find(params[:id])
        end
        def course_params
            params.require(:course).permit(:title, :total_hours, :instructor_id)
        end
end
