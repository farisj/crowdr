class RestaurantsController < ApplicationController
	def index
		@restaurants = ApiWrapper.new.get_data
	end
end
