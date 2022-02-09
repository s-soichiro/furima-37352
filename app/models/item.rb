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
    validates :price, numericality: {only_integer: true, message: "is invalid. Must input half-width value."}
  end
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid. Must input Enter within range."}
  

  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefectures_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_date_id, numericality: { other_than: 1 , message: "can't be blank"}
end
