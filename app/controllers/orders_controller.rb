class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]


  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      redirect_to root_path
      @order_delivery.save
    else
      render :index
    end
  end


  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
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
