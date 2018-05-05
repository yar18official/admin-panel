class CohortsController < ApplicationController
    def index
        @cohorts = Cohort.sorted
    end
    
    def show
        @cohort = Cohort.find(params[:id])
    end

    def new
        @cohort = Cohort.new
    end

    def create
        @cohort = Cohort.new(cohort_params)
        if @cohort.save
            redirect_to(cohorts_path)
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

    def cohort_params
        params.require(:cohort).permit(:title, :start_date, :end_date, :employee_id)
    end
end
