class CourseRegistration < ApplicationRecord
    #include PublicActivity::Model
    #tracked owner: Proc.new{ |controller, model| controller.current_user }
    belongs_to :course
    belongs_to :student
end
