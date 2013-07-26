class SearchesController < ApplicationController
  def index
  end

  def show
    @search = Searches.new(params[:query])
  end

  def create
    search = Searches.new(params[:search][:query])
    redirect_to action: :show, :query => search.query
  end
end