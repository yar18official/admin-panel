class Course < ApplicationRecord
    has_one :course_roster
    has_many :students, through: :course_roster
    belongs_to :employee
end
