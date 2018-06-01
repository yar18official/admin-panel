class CoursesController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!
    before_action :set_course, only: [:show, :edit, :update, :destroy]

    def index
        @courses = Course.sorted
    end

    def show
        @roster = @course.course_registrations
        @course_registration = CourseRegistration.new
        @students = Student.joins('LEFT OUTER JOIN course_registrations ON course_registrations.student_id = students.id').where.not(id: CourseRegistration.where(course_id: @course.id).pluck(:student_id)).distinct
    end

    def new
        @course = Course.new
        @instructors = Instructor.all.sorted
    end

    def create
        @course = Course.create(course_params)
    end

    def edit
        @instructors = Instructor.all.sorted
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
