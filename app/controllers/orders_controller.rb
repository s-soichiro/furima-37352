class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    pay_item
    redirect_to root_path
  end

  private

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
