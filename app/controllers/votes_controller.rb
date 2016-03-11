class VotesController < ApplicationController
  def new
  	@questions = Group.find(params[:group_id]).questions
  end

  def create
  	params[:question].each do |x|
  		vote = Vote.find_by(user_id: current_user.id, question_id: x[0])
  		if vote
  			if vote.question_option_id != x[1]
  				vote.question_option_id = x[1]
  				vote.save
  			end
  		else
  			new_vote = Vote.new(user_id: current_user_id, question_id: x[0], question_option_id: x[1])
  			new_vote.save
  		end
  	end
  	user = UsersGroup.find_by(user_id: current_user_id, group_id: params[:group_id])
  	user.voted = true
  	user.save
  	redirect_to group_votes_path
  end


  def index
  	@questions = Group.find(params[:group_id]).questions
  	@voted = UsersGroup.find_by(group_id: params[:group_id], user_id: current_user.id).voted
  	@total_votes = UsersGroup.where(group_id: params[:group_id], voted: true).count
  end

  def test
  	params = { term: 'steamboat', }
  	# location='Petaling Jaya'
  	@x = Yelp.client.search('kuala lumpur', params)
    byebug
  end

  def test2
  end

end
