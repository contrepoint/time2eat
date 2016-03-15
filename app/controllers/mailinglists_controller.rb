class MailinglistsController < ApplicationController
	def create
		email = MailingList.new(group_params)
		email.save
		redirect_to root_path
	end

	private
	  def group_params
	  	params.require(:mailinglist).permit(:email)
	  end
end
