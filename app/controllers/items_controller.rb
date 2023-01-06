class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price, :user).merge(user_id: current_user.id)
  end

end
