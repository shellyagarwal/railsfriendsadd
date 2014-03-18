class Circle < ActiveRecord::Base
	has_and_belongs_to_many :users
	validates :circle_name, presence: true
end
