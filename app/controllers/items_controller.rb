class ItemsController < ApplicationController

  def index

  end

  def new
    if user_signed_in?
      @items = Item.new
    else
      redirect_to new_user_session_path
    end
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
