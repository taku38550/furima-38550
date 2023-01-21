require 'rails_helper'

RSpec.describe PurchaseRecordBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_record_buyer = FactoryBot.build(:purchase_record_buyer, item_id: item.id, user_id: user.id)
  end

  describe "購入者情報の保存" do
    context "購入者情報の保存ができる場合" do
      it "post_code, prefecture_id, city, address, building_name, phone_number, token, user_id, item_idが存在すると保存できる" do
        expect(@purchase_record_buyer).to be_valid
      end

      it "building_nameが空でも存在できる" do 
        @purchase_record_buyer.building_name = ""
        expect(@purchase_record_buyer).to be_valid
      end
    end

    context "購入者情報の保存ができない場合" do
      it "post_codeが空だと保存できない" do 
        @purchase_record_buyer.post_code = ''
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include("Post code can't be blank")
      end

      it "post_codeがハイフンなしの場合だと保存できない" do
        @purchase_record_buyer.post_code = '1234567'
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it "prefecture_idが空だと保存できない" do
        @purchase_record_buyer.prefecture_id = ''
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "prefecture_idに「---」が選択されている場合は保存できない" do
        @purchase_record_buyer.prefecture_id = 1
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空だと保存できない" do
        @purchase_record_buyer.city = ''
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空だと保存できない" do
        @purchase_record_buyer.address = ''
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空だと保存できない" do 
        @purchase_record_buyer.phone_number = ''
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが10桁未満の半角数値だと保存できない" do
        @purchase_record_buyer.phone_number = 123456789
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが12桁以上の半角数値だと保存できない" do
        @purchase_record_buyer.phone_number = 123456789012
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが半角数字以外を含んでいると保存できない" do
        @purchase_record_buyer.phone_number = 123-1234-5678
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空だと保存できない" do
        @purchase_record_buyer.token = ''
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include()
      end

      it "user_idが空だと保存できない" do
        @purchase_record_buyer.user_id = ''
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include()
      end

      it "item_idが空だと保存できない" do
        @purchase_record_buyer.item_id = ''
        @purchase_record_buyer.valid?
        expect(@purchase_record_buyer.errors.full_messages).to include()
      end
    end
  end
  
end
