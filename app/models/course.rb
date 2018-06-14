class Course < ApplicationRecord
    #include PublicActivity::Model
    #tracked owner: Proc.new{ |controller, model| controller.current_user }

    belongs_to :instructor
    has_many :course_registrations, dependent: :destroy
    has_many :students, :through => :course_registrations

    scope :sorted, lambda { order("title ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }
end
