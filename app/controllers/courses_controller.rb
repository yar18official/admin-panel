class CoursesController < ApplicationController
    def index
        @courses = Course.sorted
    end
    
    def show
        @course = Course.find(params[:id])
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if @course.save
            redirect_to(course_path)
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

    def course_params
        params.require(:course).permit(:title, :description, :hours, :employee_id)
    end
end
