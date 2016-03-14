class SearchesController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	def create
		@location = params[:search][:location]
		@searched = params[:search][:search_for]
		search_for = { term: @searched }
  	@x = Yelp.client.search(@location, search_for).businesses
		# gon.business = x.businesses.to_json  # can refactor the two .map to be done in javascript.
 		gon.markers    =	@x.map do |b|
 												[b.name,
 												b.location.coordinate.latitude,
 												b.location.coordinate.longitude]
 											end
 		gon.infowindow =	@x.map do |x|
 												["<h4>#{x.name}</h4><p>#{x.snippet_text}</p>"]
 											end
 		render 'index'
	end

end


