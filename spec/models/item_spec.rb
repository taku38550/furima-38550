require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の出品" do
    context "商品の出品がうまくいく時" do
      it "name, description, category_id, status_id, shipping_cost_id, prefecture_id, shipping_date_id, price, imageが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品の出品がうまくいかない時" do
      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionが空だと出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが空だと出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Category can't be blank")
      end

      it "status_idが空だと出品できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Status can't be blank")
      end

      it "shipping_cost_idが空だと出品できない" do
        @item.shipping_cost_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost Shipping_cost can't be blank")
      end

      it "prefecture_idが空だと出品できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Prefecture can't be blank")
      end

      it "shipping_date_idが空だと出品できない" do
        @item.shipping_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date Shipping_date can't be blank")
      end

      it "priceが空だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが半角数値を含まないと出品できない" do
        @item.price = "あ亜a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
