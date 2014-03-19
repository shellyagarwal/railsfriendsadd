class Circle < ActiveRecord::Base
	has_and_belongs_to_many :users
	belongs_to :user
	validates :circle_name, presence: true
end
