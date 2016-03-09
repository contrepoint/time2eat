class User < ActiveRecord::Base
	has_many :users_groups
	has_many :groups, through: :users_groups
	has_many :votes
end
