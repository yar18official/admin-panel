class CourseRegistrationsController < ApplicationController

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
        @course_registration = CourseRegistration.find(params[:id])
    end

    def update
        @course_registration = CourseRegistration.find(params[:id])
        if @course_registration.update_attributes(cohort_params)
            @course = Course.find(@course_registration[:course_id])
            flash[:notice] = "Course '#{@course.title}' roster updated successfully"
            redirect_to(course_path(@course_registration[:course_id]))
        else
            render('edit')
        end
    end

    def delete
        @course_registration = CourseRegistration.find(params[:id])
    end

    def destroy
        @course_registration = CourseRegistration.find(params[:id])
        @course_registration.destroy
        @student = Student.find(@course_registration[:student_id])
        flash[:notice] = "'#{@student.first_name} #{@student.last_name}' was removed"
        redirect_to(course_path(@course_registration[:course_id]))
    end

    private

    def course_registration_params
        params.require(:course_registration).permit(:course_id, :student_id)
    end
end
