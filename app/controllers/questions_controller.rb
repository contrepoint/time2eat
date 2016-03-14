class QuestionsController < ApplicationController
	before_action :authenticate_user!

  def new
  	@errors = []
  end

  def create
  	q = Question.new(question_params)
  	q.group_id = params[:group_id]
  	if q.save
  		q_options_arr = params[:question_options].split(',').collect { |x| x.strip || x }
  		q_options_arr.each do |x|
  			options = QuestionOption.create(option_text: x, question_id: q.id)
  		end
  		redirect_to group_path(q.group_id)
  	else
  		@errors = q.errors.full_messages
  		render 'new'
  	end
  end

  private

  	def question_params
  		params.require(:question).permit(:question_text, :question_type)
  	end
end
