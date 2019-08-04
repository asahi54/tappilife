class ShopsController < ApplicationController
  def show
    @shop = Shop.find(params[:id])
  end

  def index
    @shops = Shop.all.page(params[:page]).per(15)
  end
end
