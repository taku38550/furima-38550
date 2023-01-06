class ItemsController < ApplicationController

  def index
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price, :user).merge(user_id: current_user.id)
  end

end
