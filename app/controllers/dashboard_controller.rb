class DashboardController < ApplicationController
    before_action :authenticate_user!

    def home
    end

    def index
        @activities = PublicActivity::Activity.all
    end

end
