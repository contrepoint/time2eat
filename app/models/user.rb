class User < ActiveRecord::Base
		validates :username, :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :users_groups
	has_many :groups, through: :users_groups
	has_many :votes
end
