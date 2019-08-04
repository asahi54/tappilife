class TakesController < ApplicationController
  before_action :authenticate_user!

  def create
    drink = Drink.find(params[:drink_id])
    current_user.take(drink)
    flash[:success] = 'Myタピ記録に登録しました。'
    redirect_to mycalories_user_url(id: current_user.id)
  end

  def destroy
    drink = Drink.find(params[:drink_id])
    current_user.untake(drink)
    flash[:success] = 'Myタピ記録から削除しました'
    redirect_back(fallback_location: root_path)
  end
end
