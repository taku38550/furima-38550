class PurchaseRecordBuyer
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}, length: {maximum: 11}
    validates :token
    validates :user_id
    validates :item_id
  end


  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end