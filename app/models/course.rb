class Course < ApplicationRecord
    belongs_to :employee
    has_many :course_enrollments
    has_many :students, :through => :course_enrollments 

    scope :sorted, lambda { order("title ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }
end
