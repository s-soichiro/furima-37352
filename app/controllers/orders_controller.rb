class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]


  def index
    
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      redirect_to root_path
      @order.save
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
    params.permit(:token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
