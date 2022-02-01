class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefectures
  belongs_to :delivery_date

  validates :name, presence: true
  validates :content, presence: true
  

  with_options presence: true do
    validates :price, numericality: {with: /\A[0-9]+\z/, message: "is invalid. Must input half-width value."}
  end
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid. Must input Enter within range."}
  

  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefectures_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_date_id, numericality: { other_than: 1 , message: "can't be blank"}
end
