class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_prams)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  
  def item_prams
    params.require(:item).permit(:image, :name, :content, :category_id, :situation_id, :delivery_charge_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
