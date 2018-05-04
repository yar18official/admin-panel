class Course < ApplicationRecord
    belongs_to :employee
    has_many :course_enrollments
    has_many :students, :through => :course_enrollments 
end
