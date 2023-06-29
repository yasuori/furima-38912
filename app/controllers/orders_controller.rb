class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if user_signed_in? && current_user.id != @item.user_id && @item.order == nil
      @item_order = ItemOrder.new
    else
      redirect_to root_path
    end
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end

  def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
       amount: order_params[:price],
       card: order_params[:token],    
       currency: 'jpy'                 
      )
   end
end
