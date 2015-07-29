class SearchController < ApplicationController

  def index
    @search = ApiWrapper.new
    # @restaurants = @search.get_data(search_params).values
  end

  def create
    @search = ApiWrapper.new
    @restaurants = @search.get_data(search_params).values
    # binding.pry
    render :index
  end


  private
    def search_params
      params.require(:search).permit(:query, :lt, :lg)
    end

end