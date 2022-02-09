class OrderDelivery

  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefectures_id, :municipalities, :adress, :building_name, :tel_num, :order_id, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :adress
    validates :tel_num
  end
  validates :tel_num, numericality: { only_integer: true, message: "is invalid. Input only number"}
  validates :tel_num, numericality: { minimum: 10, maximum: 11, message: "Input Within range"}
  validates :prefectures_id, numericality: { other_than: 1 , message: "can't be blank"}



  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Delivery.create(post_code: post_code,prefectures_id: prefectures_id,municipalities: municipalities,adress: adress,building_name: building_name,tel_num: tel_num,order_id: order.id)
  end
end