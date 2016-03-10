class Question < ActiveRecord::Base
	validates :question_text, :question_type, presence: true

	belongs_to :group
	has_many :question_options
end
