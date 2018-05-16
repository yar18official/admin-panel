class CourseRegistrationsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!
    before_action :set_course_registration, only: [:show, :edit, :update, :destroy]

    def new
        @course_registration = CourseRegistration.new
    end

    def create
        @course_registration = CourseRegistration.create(course_registration_params)
        if @course_registration.save
            @student = Student.find(@course_registration[:student_id])
            flash[:notice] = "#{@student.first_name} #{@student.last_name} was added to course"
            redirect_to(course_path(@course_registration[:course_id]))
        else
            render('new')
        end
    end

    def edit
    end

    def update
        if @course_registration.update_attributes(cohort_params)
            @course = Course.find(@course_registration[:course_id])
            flash[:notice] = "Course '#{@course.title}' roster updated successfully"
            redirect_to(course_path(@course_registration[:course_id]))
        else
            render('edit')
        end
    end

    def delete
    end

    def destroy
        @course_registration.destroy
        @student = Student.find(@course_registration[:student_id])
        flash[:notice] = "'#{@student.first_name} #{@student.last_name}' was removed"
        redirect_to(course_path(@course_registration[:course_id]))
    end

    private
        def set_course_registration
            @course_registration = CourseRegistration.find(params[:id])
        end
        def course_registration_params
            params.require(:course_registration).permit(:course_id, :student_id)
        end
end
