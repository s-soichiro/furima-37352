class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefectures
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :name, presence: true
  validates :content, presence: true
  

  with_options presence: true do
    validates :price, numericality: {only_integer: true, message: "半角の数値を入力してください"}
  end
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "範囲内の値を入力してください"}
  

  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :status_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :postage_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :prefectures_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :delivery_date_id, numericality: { other_than: 1 , message: "を選択してください"}
end
