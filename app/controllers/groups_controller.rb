class GroupsController < ApplicationController

	before_action :authenticate_user!

	before_action :check_user_own_group ,only: []

  autocomplete :user, :email

  def create
		group = Group.new(group_params)

		group.made_by_id = current_user.id

		members = params[:group][:members]

		members_array = members.split(',').collect{|x| x.strip || x }

		if group.save

			UsersGroup.create!(user_id: current_user.id,group_id: group.id,role: "admin")

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
  	user = UsersGroup.where(group_id: params[:id], user_id: current_user.id)
  	if user
  		@group = Group.find(params[:id])
			@current_user_role = UsersGroup.find_by(user_id: current_user.id).role
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
			flash[:success] = "Success delete user from this group"
			redirect_to edit_group_url(group_id)
		else
			flash[:danger] = "Error delete user"
			redirect_to edit_group_url(group_id)
		end

	end

	def add_user_to_group
		#user_to_add = User.find_by(username: params["username"])

		error_return = { content:"errors add user" }

		respond_to do |format|
			if user_to_add = User.find_by(username: params["username"])

				unless UsersGroup.find_by(user_id: user_to_add.id, group_id: params["group"])
					group_to_add = UsersGroup.new(user_id: user_to_add.id, group_id: params["group"])
					group_to_add.role = 'user'

					if group_to_add.save
						#format.html { redirect_to @product, notice: "Save process completed!" }
						# format.json { status: :created }
						#format.json { render :json => true }
						flash[:success] = "Success Add member"

						success_return = { "window_location":"#{edit_group_url(params["group"])}" }

						format.json { render :json => success_return }
					else
						# format.html {
						#   flash.now[:notice]="Save proccess coudn't be completed!"
						#   render :new
						# }
						format.json { render :json => error_return, :status => :unprocessable_entity }
					end
				else
					error_return = { content:"This user already belong to this group" }
					format.json { render :json => error_return, :status => :unprocessable_entity }
				end
			else
				error_return = { content:"Can not find this user" }
				format.json { render :json => error_return, :status => :unprocessable_entity }
			end
		end

	end

  private

	def group_params
		params.require(:group).permit(:name, :description)
	end

	def check_user_own_group

	end

	# def add_user_group_params
	# 	params.permit(:user_id, :group_id)
	# end

end
