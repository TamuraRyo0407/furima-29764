class ItemsController < ApplicationController
  def index  
  end

  def new  
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :delivery_fee_defrayer_id, :forwarder_area_id, :sending_day_id, :price).merge(user_id: current_user.id)
  end
end
