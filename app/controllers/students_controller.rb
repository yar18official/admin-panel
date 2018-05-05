class StudentsController < ApplicationController
    def index
        @students = Student.sorted
    end
    
    def show
        @student = Student.find(params[:id])
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
