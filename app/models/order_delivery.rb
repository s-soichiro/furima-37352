class OrderDelivery

  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefectures_id, :municipalities, :adress, :building_name, :tel_num, :order_id, :item_id, :user_id

  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Delivery.create(post_code: post_code,prefectures_id: prefectures_id,municipalities: municipalities,adress: adress,building_name: building_name,tel_num: tel_num,order_id: order.id)
  end
end