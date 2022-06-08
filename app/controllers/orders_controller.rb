class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @item = Item.find(params[:item_id])
    @purchase_order = PurchaseOrder.new
    if current_user.id == @item.user_id
      redirect_to "/"
    end
    if @item.purchase.present?
      redirect_to "/"
    end
  end

  def new
    @purchase_order = PurchaseOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_order = PurchaseOrder.new(order_params)
    if @purchase_order.valid?
      @purchase_order.save
      redirect_to root_path
      pay_item
    else
      render :index
    end
  end

  private
  def order_params
  params.require(:purchase_order).permit(:post_number, :prefecture_id, :city, :address, :building_name, :telephone_number).merge(token: params[:token] ,user_id: current_user.id, item_id: @item.id)
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

