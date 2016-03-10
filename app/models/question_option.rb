class QuestionOption < ActiveRecord::Base
	validates :option_text, presence: true

	belongs_to :question
	has_many :votes
end
