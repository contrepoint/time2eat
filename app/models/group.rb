class Group < ActiveRecord::Base
	validates :name, presence: true

	has_many :users_groups
	has_many :users, through: :users_groups
	has_many :questions
end
