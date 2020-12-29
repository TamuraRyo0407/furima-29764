class OrdersController < ApplicationController
  before_action  @item = Item.find(params[:item_id]), only:[:index ,:create]
  
  def index 
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if  @order.valid?

        pay_item
        @order.save
        redirect_to root_path
    else 
      render :index 
    end
  end

  private

  def order_params
    params.require(:order).permit(:zip_code,:prefecture_id,:municipality ,:address,:building_name ,:phone_number).merge(user_id: current_user.id,item_id: @item.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],   
      currency: 'jpy'                 
    )
  end
end
