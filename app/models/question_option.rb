class QuestionOption < ActiveRecord::Base
	validates :option_text, presence: true
	# scope :highest_vote_count, -> {
	# 	joins(:votes).group("question_options.id").order("count(question_options.id) DESC")
	# }

	belongs_to :question
	has_many :votes
end
