class SearchesController < ApplicationController

  def show
    @stores, @all = Store.find_store_by_zipcode(params[:zipcode])
  end

end
