class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [:index, :show, :takes]
  
  # def index
  #   @users = User.order(id: :desc).page(params[:page]).per(20)
  # end
  def show
    @user = User.find(params[:id])
  end
  
  def mycalories
    @user = User.find(params[:id])
    @drinks = @user.drinks.page(params[:page])
    @cal_total = @drinks.sum(:calorie)
  end
end
