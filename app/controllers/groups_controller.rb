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
  end

  def index
  	@groups = current_user.groups.sort
  end

  def edit
  	@group = Group.find(params[:id])
		@users = @group.users.all
		#@users = User.where(@users_group)
  end

  private

	  def group_params
	  	params.require(:group).permit(:name, :description)
	  end

end
