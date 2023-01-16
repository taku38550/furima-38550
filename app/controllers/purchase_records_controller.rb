class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, expect: :index

  def index
    @item = Item.find(params[:item_id])
    @purchase_record_buyer = PurchaseRecordBuyer.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_buyer = PurchaseRecordBuyer.new(purchase_record_buyer_params)
    if @purchase_record_buyer.valid?
      @purchase_record_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
  end

  private

  def purchase_record_buyer_params
    params.require(:purchase_record_buyer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item_id)
  end

end
