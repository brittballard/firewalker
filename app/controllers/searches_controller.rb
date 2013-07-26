class SearchesController < ApplicationController
  def index
  end

  def show
    @query = params[:query]
  end

  def create
    redirect_to action: :show, :query => params[:search][:query]
  end
end