class OrdersController < ApplicationController
  def index 
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if  @order.valid?
        @order.save
        redirect_to root_path
    else 
      render :index 
    end
  end

  private

  def order_params
    params.permit(:zip_code,:prefecture_id,:municipality ,:address,:building_name ,:phone_number,:hoge).merge(user_id: current_user.id,item_id: @item.id)
  end
end
