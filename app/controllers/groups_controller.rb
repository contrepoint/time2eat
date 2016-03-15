class GroupsController < ApplicationController
	before_action :authenticate_user!

  autocomplete :user, :email

  def create
		group = Group.new(group_params)
		members = params[:group][:user_email]
		members_array = members.split(',').collect{|x| x.strip || x }

		if group.save
			members_array.each do |x|
				users_group = UsersGroup.create(user_id: User.find_by(email: x).id, group_id: group.id)
			end
			redirect_to group_path(group.id)
		else
			@errors = group.errors.full_messages
			render 'new'
		end
  end

  def new
  	@errors = []
  end

  def show
  	@group = Group.find(params[:id])
  	@questions = Group.find(params[:id]).questions
  	@voted = UsersGroup.find_by(group_id: params[:id], user_id: current_user.id).voted
  	@total_votes = UsersGroup.where(group_id: params[:id], voted: true).count
  end

  def index
  	@groups = current_user.groups.sort
  end

  def edit
  	user = UsersGroup.find_by(group_id: params[:id], user_id: current_user.id)
  	if user
  		@group = Group.find(params[:id])
  	else
  		redirect_to groups_path
  	end

  end

  def update
		group = Group.find(params[:id])
  	group.update!(group_params)
  	redirect_to group_path
  end

  def destroy
  	user = UsersGroup.find_by(group_id: params[:id], user_id: current_user.id)
  	if user
  		@group = Group.find(params[:id])
  		# @group.destroy
  		redirect_to groups_path
  	else
  		redirect_to groups_path
  	end
  end

  private

	  def group_params
	  	params.require(:group).permit(:name, :description)
	  end

end
