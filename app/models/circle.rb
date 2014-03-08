class Circle < ActiveRecord::Base
	has_many :users, :through => :friendships, :class_name => "User"
	has_many :friendships
	validates :circle_name, :uniqueness =>true
end
