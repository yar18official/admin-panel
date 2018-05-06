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
            flash[:notice] = "Employee '#{@employee.first_name} #{@employee.last_name}' created successfully"
            redirect_to(employees_path)
        else
            render('new')
        end
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        if @employee.update_attributes(employee_params)
            flash[:notice] = "Employee '#{@employee.first_name} #{@employee.last_name}' updated successfully"
            redirect_to(employee_path(@employee))
        else
            render('edit')
        end
    end

    def delete
        @employee = Employee.find(params[:id])
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        flash[:notice] = "Employee '#{@employee.first_name} #{@employee.last_name}' deleted successfully"
        redirect_to(employees_path)
    end
    
    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :position, :salary, :age, :education, :email, :phone_number, :password_digest)
    end
end
