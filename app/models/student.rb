class Student < ApplicationRecord
    belongs_to :cohort
    has_many :course_rosters
    has_many :courses, through: :course_rosters
end
