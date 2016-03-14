class VotesController < ApplicationController
	before_action :authenticate_user!

  def new
  	@voted = UsersGroup.find_by(group_id: params[:group_id], user_id: current_user.id).voted
  	@questions = Group.find(params[:group_id]).questions
  end

  def create
  	params[:question].each do |x|
  		vote = Vote.find_by(user_id: current_user.id, q: x[0].to_i)
  		if vote
  			if vote.question_option_id != x[1].to_i
  				vote.question_option_id = x[1].to_i
  				vote.q = x[0].to_i
  				vote.save
  			end
  		else
  			new_vote = Vote.new(user_id: current_user.id, q: x[0], question_option_id: x[1].to_i)
  			new_vote.save
  		end
  	end
  	user = UsersGroup.find_by(user_id: current_user.id, group_id: params[:group_id])
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
  	params = { term: 'steamboat' }
  	@x = Yelp.client.search('kuala lumpur', params).businesses
  	# gon.business = x.businesses.to_json  # can refactor the two .map to be done in javascript.
 		gon.markers    =	@x.map do |b|
 												[b.name,
 												b.location.coordinate.latitude,
 												b.location.coordinate.longitude]
 											end
 		gon.infowindow =	@x.map do |x|
 												["<h4>#{x.name}</h4><p>#{x.snippet_text}</p>"]
 											end
  end

  def test2
  end

end
