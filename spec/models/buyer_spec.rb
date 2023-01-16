require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer)
  end

  describe "購入者情報の保存" do
    context "購入者情報の保存ができる場合" do
      it "post_code, prefecture_id, city, address, building_name, phone_numberが存在すると保存できる" do
        expect(@buyer).to be_valid
      end

      it "building_nameが空でも存在できる" do 
        @buyer.building_name = ""
        expect(@buyer).to be_valid
      end
    end

    context "購入者情報の保存ができない場合" do
      it "post_codeが空だと保存できない" do 
        @buyer.post_code = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end

      it "post_codeがハイフンなしの場合だと保存できない" do
        @buyer.post_code = '1234567'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end

      it "prefecture_idが空だと保存できない" do
        @buyer.prefecture_id = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end

      it "prefecture_idに「---」が選択されている場合は保存できない" do
        @buyer.prefecture_id = 1
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end

      it "市区町村が空だと保存できない" do
        @buyer.city = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end

      it "番地が空だと保存できない" do
        @buyer.address = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end

      it "電話番号が空だと保存できない" do 
        @buyer.phone_number = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end

      it "電話番号が10桁未満の半角数値だと保存できない" do
        @buyer.phone_number = 123456789
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end

      it "電話番号が12桁以上の半角数値だと保存できない" do
        @buyer.phone_number = 123456789012
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end

      it "電話番号が半角数字以外を含んでいると保存できない" do
        @buyer.phone_number = 123-1234-5678
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include()
      end
    end
  end

end
