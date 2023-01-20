class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, expect: :index
  before_action :move_to_index, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_record_buyer = PurchaseRecordBuyer.new
  end

  def create
    @purchase_record_buyer = PurchaseRecordBuyer.new(purchase_record_buyer_params)
    if @purchase_record_buyer.valid?
      pay_item
      @purchase_record_buyer.save
      return redirect_to root_path
    else
      render :index
    end
  end

  def show
  end

  private

  def purchase_record_buyer_params
    params.require(:purchase_record_buyer).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price, 
      card: purchase_record_buyer_params[:token],    
      currency: 'jpy'                
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if (@item.user_id == current_user.id) || @item.purchase_record != nil 
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
