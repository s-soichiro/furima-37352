class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :status_id, :postage_id, :prefectures_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
