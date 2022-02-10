class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]


  def index
    @item = Item.find(params[:item_id])
    if current_user.id != @item.user_id
      if @item.order == nil
        @order_delivery = OrderDelivery.new
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: @order_delivery.token,
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_delivery).permit(:post_code,:prefectures_id,:municipalities,:adress,:building_name,:tel_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
