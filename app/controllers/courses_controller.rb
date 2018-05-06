class CoursesController < ApplicationController
    
    layout 'admin_panel'
    
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
            flash[:notice] = "Course '#{@course.title}' created successfully"
            redirect_to(courses_path)
        else
            render('new')
        end
    end

    def edit
        @course = Course.find(params[:id])
    end

    def update
        @course = Course.find(params[:id])
        if @course.update_attributes(course_params)
            flash[:notice] = "Course '#{@course.title}' updated successfully"
            redirect_to(course_path(@course))
        else
            render('edit')
        end
    end

    def delete
        @course = Course.find(params[:id])
    end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        flash[:notice] = "Course '#{@course.title}' deleted successfully"
        redirect_to(courses_path)
    end
    
    private

    def course_params
        params.require(:course).permit(:title, :description, :hours, :employee_id)
    end
end
