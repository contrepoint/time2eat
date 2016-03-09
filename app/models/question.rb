class Question < ActiveRecord::Base
	belongs_to :group
	has_many :question_options
end
