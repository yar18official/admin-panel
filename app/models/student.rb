class Student < ApplicationRecord
    belongs_to :cohort
    has_many :course_registrations
    has_many :courses, :through => :course_registrations

    scope :sorted, lambda { order("last_name ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }
end
