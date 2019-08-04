class DrinksController < ApplicationController
  def show
    @drink = Drink.find(params[:id])
  end

  def index
    @drinks = Drink.where(shop_id: params[:shop_id])
  end
end
