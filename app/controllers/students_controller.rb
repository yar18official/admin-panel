class StudentsController < ApplicationController
    
    def index
        @students = Student.sorted
        @student = Student.new
    end
    
    def show
        @student = Student.find(params[:id])
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            flash[:notice] = "Student '#{@student.first_name} #{@student.last_name}' created successfully"
            redirect_to(students_path)
        else
            render('new')
        end
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
        if @student.update_attributes(student_params)
            flash[:notice] = "Student '#{@student.first_name} #{@student.last_name}' updated successfully"
            redirect_to(students_path(@student))
        else
            render('edit')
        end
    end

    def delete
        @student = Student.find(params[:id])
    end

    def destroy
        @student = Student.find(params[:id])
        @student.destroy
        flash[:notice] = "Student '#{@student.first_name} #{@student.last_name}' deleted successfully"
        redirect_to(students_path)
    end
    
    private

    def student_params
        params.require(:student).permit(:first_name, :last_name, :cohort_id, :age, :education, :email, :phone_number)
    end
end
