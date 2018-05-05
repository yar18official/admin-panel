class EmployeesController < ApplicationController
    def index
        @employees = Employee.sorted
    end
    
    def show
        @employee = Employee.find(params[:id])
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def delete
    end

    def destroy
    end
end
