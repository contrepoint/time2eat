class Vote < ActiveRecord::Base
	validates :user_id, :question_option_id, presence: true
	# validates :user, uniqueness: {scope: :question}

	belongs_to :user
	belongs_to :question_option
end
