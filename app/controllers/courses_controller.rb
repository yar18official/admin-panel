class CoursesController < ApplicationController
    def index
        @courses = Course.sorted
    end
    
    def show
        @course = Course.find(params[:id])
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
