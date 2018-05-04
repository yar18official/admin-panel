class Student < ApplicationRecord
    belongs_to :cohort
    has_many :course_enrollments
    has_many :courses, :through => :course_enrollments
end
