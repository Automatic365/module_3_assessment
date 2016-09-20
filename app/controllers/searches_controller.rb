class SearchesController < ApplicationController

  def show
    @stores, @total = Store.find_store_by_zipcode(params[:zipcode])
  end

end
