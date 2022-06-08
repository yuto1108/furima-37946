require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe "商品購入機能" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_order = FactoryBot.build(:purchase_order, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context "商品購入ができる時" do
      it "token, post_number, prefecture_id, city, address, building_name, telephone_numberが正しく入力されている" do
        expect(@purchase_order).to be_valid
      end

      it "building_nameは空でも保存できる" do
        @purchase_order.building_name = ""
        @purchase_order.valid?
        expect(@purchase_order).to be_valid
      end
    end

    context "商品購入ができないとき" do
      it "tokenが空" do
        @purchase_order.token = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end

      it "post_numberが空" do
        @purchase_order.post_number = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Post number can't be blank")
      end

      it "prefecture_idが1" do
        @purchase_order.prefecture_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空" do
        @purchase_order.city = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空" do
        @purchase_order.address = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Address can't be blank")
      end

      it "telephone_numberが空" do
        @purchase_order.telephone_number = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Telephone number can't be blank")
      end

      it "user_id紐付いていない" do
        @purchase_order.user_id = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("User can't be blank")
      end

      it "item_idと紐付いていない" do
        @purchase_order.item_id = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
      end

      it "post_numberの「-」ない" do
        @purchase_order.post_number = "1234567"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Post number is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it "telephone_numberが9桁以下" do
        @purchase_order.telephone_number = "123456789"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Telephone number is too short")
      end
      
      it "telephone_numberに「-」がある" do
        @purchase_order.telephone_number = "123-1234-1234"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Telephone number is invalid. Input only number")
      end
    end
  end
end
