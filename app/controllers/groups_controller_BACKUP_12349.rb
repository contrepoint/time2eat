class GroupsController < ApplicationController

	before_action :authenticate_user!

	before_action :check_user_own_group ,only: []

  autocomplete :user, :email

  def create
		group = Group.new(group_params)
<<<<<<< HEAD
		group.made_by_id = current_user.id
		members = params[:group][:user_email]
=======
		members = params[:group][:members]
>>>>>>> f1f01b3a6f8c9029347577a43b577f59b9d0cbdf
		members_array = members.split(',').collect{|x| x.strip || x }

		if group.save
			members_array.each do |x|
				users_group = UsersGroup.new(user_id: User.find_by(username: x).id, group_id: group.id)
				if users_group # username exists
					users_group.save
				else
				# need to show an error if username is not found.
				end
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
  	user = UsersGroup.find_by(group_id: params[:id], user_id: current_user.id)
  	if user
	  	@group = Group.find(params[:id])
	  	@questions = Group.find(params[:id]).questions
	  	@voted = UsersGroup.find_by(group_id: params[:id], user_id: current_user.id).voted
	  	@total_votes = UsersGroup.where(group_id: params[:id], voted: true).count
	  else
	  	redirect_to groups_path
	  end
  end

  def index
  	@groups = current_user.groups.sort
  end

  def edit
  	user = UsersGroup.find_by(group_id: params[:id], user_id: current_user.id)
  	if user
  		@group = Group.find(params[:id])
  		@group = Group.find(params[:id])
  		@users = @group.users.all
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

	def deleteuser_from_group
		user_id = params[:user_id]
		group_id = params[:group_id]

		user_to_delete = UsersGroup.find_by(user_id: user_id,group_id: group_id)

		if user_to_delete.destroy
			flash.now[:success] = "Success delete user from this group"
			render 'edit'
		else
			flash.now[:danger] = "Error delete user"
			render 'edit'
		end

	end

  private

	def group_params
		params.require(:group).permit(:name, :description)
	end

	def check_user_own_group

	end

end
