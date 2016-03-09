class GroupsController < ApplicationController
  def create
		group = Group.new(group_params)
		members = params[:members]
		members_array = members.split(',').collect{|x| x.strip || x }
		if group.save
			members_array.each do |x|
				users_group = UsersGroup.create(user_id: User.find_by(email: x).id, group_id: group.id)
			end
			redirect_to root_path
		else
			render 'new'
		end
  end

  def new
  end

  def show
  	@group = Group.find(params[:id])
  end

  private

  def group_params
  	params.require(:group).permit(:name, :description)
  end

end
