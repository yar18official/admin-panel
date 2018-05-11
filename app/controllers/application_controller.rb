class ApplicationController < ActionController::Base
    
    before_action :authenticate_user!
    
    def index
        puts "Admin Panel!"
    end
end
