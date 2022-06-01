class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :content
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_date_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters" }
  end
end
