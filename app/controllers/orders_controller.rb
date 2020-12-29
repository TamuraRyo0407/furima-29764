class OrdersController < ApplicationController
  def index 
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_16dbe3b76307d309cdecbde9" 
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],   
      currency: 'jpy'                 
    )
  end
end
