class CohortsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!
    before_action :set_cohort, only: [:show, :edit, :update, :destroy]

    def index
        @cohorts = Cohort.sorted
    end

    def show
        @roster = @cohort.students.sorted
        @course_registration = CourseRegistration.new
        @students = Student.all.sorted

    end

    def new
        @cohort = Cohort.new
        @instructors = Instructor.all.sorted
    end

    def create
        @cohort = Cohort.create(cohort_params)
    end

    def edit
        @instructors = Instructor.all.sorted
    end

    def update
        @cohort.update(cohort_params)
    end

    def destroy
        @cohort.destroy
    end

    private
        def set_cohort
            @cohort = Cohort.find(params[:id])
        end

        def cohort_params
            params.require(:cohort).permit(:title, :start_date, :end_date, :instructor_id)
        end
end
