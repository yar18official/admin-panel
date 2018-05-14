class CoursesController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!

    def index
        @courses = Course.sorted
        @course = Course.new
    end

    def show
        @course = Course.find(params[:id])
        @roster = @course.students.sorted
        @course_registration = CourseRegistration.new
        @students = Student.all.sorted
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
        params.require(:course).permit(:title, :total_hours, :instructor_id)
    end
end
