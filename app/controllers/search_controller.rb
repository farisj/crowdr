class SearchController < ApplicationController

  def index
    @search = ApiWrapper.new
  end

  def create
    @search = ApiWrapper.new.get_data(search_params)
  end


  private
    def search_params
      params.require(:search).permit(:query, :lt, :lg)
    end

end