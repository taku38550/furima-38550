class Item < ApplicationRecord

  validates :name             , presence: true
  validates :description      , presence: true
  validates :category_id      , presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id        , presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id , presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id    , presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id , presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price            , presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }
  validates :image            , presence: true

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date
end
