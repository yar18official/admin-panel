class EmployeesController < ApplicationController
    def index
        @employees = Employee.sorted
    end
    
    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to(employee_path)
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

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :position, :salary, :age, :education, :email, :phone_number, :password_digest)
    end
end
