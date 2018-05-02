class Employee < ApplicationRecord
    has_many :courses
    has_one :cohort

end
