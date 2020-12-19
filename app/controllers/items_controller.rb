class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :item_id_find, only:[:show,:edit, :update,:destroy]
  
  def index  
    @items = Item.all.order("created_at DESC")
  end

  def new  
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new 
    end
  end

  def show
  end

  def edit
    if  @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit 
    end
  end

  def destroy
    if  @item.destroy
        redirect_to root_path
    else
        redirect_to  item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :delivery_fee_defrayer_id, :forwarder_area_id, :sending_day_id, :price).merge(user_id: current_user.id)
  end

  def item_id_find
    @item = Item.find(params[:id])
  end
end
