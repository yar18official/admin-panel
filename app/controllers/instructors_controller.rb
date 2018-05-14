class InstructorsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!

    def index
        @instructors = Instructor.sorted
        @instructor = Instructor.new
    end

    def show
        @instructor = Instructor.find(params[:id])
    end

    def new
        @instructor = Instructor.new
    end

    def create
        @instructor = Instructor.new(instructor_params)
        if @instructor.save
            flash[:notice] = "Instructor '#{@instructor.first_name} #{@instructor.last_name}' created successfully"
            redirect_to(instructors_path)
        else
            render('new')
        end
    end

    def edit
        @instructor = Instructor.find(params[:id])
    end

    def update
        @instructor = Instructor.find(params[:id])
        if @instructor.update_attributes(instructor_params)
            flash[:notice] = "Instructor '#{@instructor.first_name} #{@instructor.last_name}' updated successfully"
            redirect_to(instructor_path(@instructor))
        else
            render('edit')
        end
    end

    def delete
        @instructor = Instructor.find(params[:id])
    end

    def destroy
        @instructor = Instructor.find(params[:id])
        @instructor.destroy
        flash[:notice] = "Instructor '#{@instructor.first_name} #{@instructor.last_name}' deleted successfully"
        redirect_to(instructors_path)
    end

    private

    def instructor_params
        params.require(:instructor).permit(:first_name, :last_name, :salary, :age, :education, :user_id)
    end
end
