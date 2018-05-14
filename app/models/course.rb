class Course < ApplicationRecord
    belongs_to :instructor
    has_many :course_registrations
    has_many :students, :through => :course_registrations

    scope :sorted, lambda { order("title ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }
end
