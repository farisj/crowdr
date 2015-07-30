class SearchController < ApplicationController

  def index
    @search = ApiWrapper.new
  end

  def create
    @search = ApiWrapper.new
    @restaurants = @search.get_data(search_params).values

    respond_to do |format|
      format.html { render :index }

      format.js { }
    end

  end

  private
    def search_params
      params.require(:search).permit(:query, :lt, :lg)
    end

end