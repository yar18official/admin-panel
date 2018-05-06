class ApplicationController < ActionController::Base
    
    layout 'admin_panel'
    
    def index
        puts "Admin Panel!"
    end
end
