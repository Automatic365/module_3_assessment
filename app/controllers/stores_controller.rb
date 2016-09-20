class StoresController < ApplicationController

  def show
    @store = Store.find_store_by_id(params[:id])
  end

end
