class OrderDelivery

  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefectures_id, :municipalities, :adress, :building_name, :tel_num, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフン(-)を含む値を入力してください"}
    validates :municipalities
    validates :adress
    validates :tel_num
    validates :user_id
    validates :item_id
  end
  validates :tel_num, numericality: { only_integer: true, message: "は数字のみで入力してください"}
  validates :tel_num, length: { minimum: 10, maximum: 11, message: "は正しい文字数で入力してください"}
  validates :prefectures_id, numericality: { other_than: 1 , message: "を選択してください"}



  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Delivery.create(post_code: post_code,prefectures_id: prefectures_id,municipalities: municipalities,adress: adress,building_name: building_name,tel_num: tel_num,order_id: order.id)
  end
end