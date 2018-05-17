class Instructor < ApplicationRecord
    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }
    belongs_to :user
    has_many :courses
    has_one :cohort

    scope :sorted, lambda { order("last_name ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }

    def full_name
        "#{first_name} #{last_name}"
    end
end
