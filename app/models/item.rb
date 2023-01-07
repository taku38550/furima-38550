class Item < ApplicationRecord

  validates :name             , presence: true
  validates :description      , presence: true
  validates :category_id      , presence: true, numericality: { other_than: 1, message: "Category can't be blank" }
  validates :status_ig        , presence: true, numericality: { other_than: 1, message: "Status can't be blank" }
  validates :shipping_cost_id , presence: true, numericality: { other_than: 1, message: "Shipping_cost can't be blank" }
  validates :prefecture_id    , presence: true, numericality: { other_than: 1, message: "Prefecture can't be blank" }
  validates :shipping_date_id , presence: true, numericality: { other_than: 1, message: "Shipping_date can't be blank" }
  validates :price            , presence: true, numericality: { greater_than_or_equal_to: 300, less_than_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :image            , presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
end
