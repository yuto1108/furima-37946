require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品機能" do
    context "商品が出品できるとき" do
      it "image、name、content、category_id、situation_id、delivery_charge_id、prefecture_id、delivery_date_id、priceが正しく入力されている"do
        expect(@item).to be_valid
      end
    end

    context "ユーザー登録ができないとき" do
      it "nameが空" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "imageが空が空" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "contentが空" do
        @item.content = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it "category_idが1" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "situation_idが1" do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end

      it "delivery_charge_idが1" do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it "prefecture_idが1" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "delivery_date_idが1" do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end

      it "priceが空" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが299以下" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it "priceが10000000以上" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it "priceが全角数字を含んでいる" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end
