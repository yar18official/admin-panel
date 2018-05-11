class CohortsController < ApplicationController
    
    before_action :authenticate_user!

    def index
        @cohorts = Cohort.sorted
        @cohort = Cohort.new
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
            flash[:notice] = "Cohort '#{@cohort.title}' created successfully"
            redirect_to(cohorts_path)
        else
            render('new')
        end
    end

    def edit
        @cohort = Cohort.find(params[:id])
    end

    def update
        @cohort = Cohort.find(params[:id])
        if @cohort.update_attributes(cohort_params)
            flash[:notice] = "Cohort '#{@cohort.title}' updated successfully"
            redirect_to(cohort_path(@cohort))
        else
            render('edit')
        end
    end

    def delete
        @cohort = Cohort.find(params[:id])
    end

    def destroy
        @cohort = Cohort.find(params[:id])
        @cohort.destroy
        flash[:notice] = "Cohort '#{@cohort.title}' deleted successfully"
        redirect_to(cohorts_path)
    end

    private

    def cohort_params
        params.require(:cohort).permit(:title, :start_date, :end_date, :employee_id)
    end
end
