class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :address, :building_name, :telephone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :post_number, format:{ with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :address
    validates :telephone_number, format:{ with: /\A\d{10,11}\z/, message: "is too short. Input only number" }
    validates :user_id
    validates :item_id
  end
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end