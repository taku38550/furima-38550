class Item < ApplicationRecord

  validates :name             , presence: true
  validates :description      , presence: true
  validates :category_id      , presence: true
  validates :status_ig        , presence: true
  validates :shipping_cost_id , presence: true
  validates :prefecture_id    , presence: true
  validates :shipping_date_id , presence: true
  validates :price            , presence: true
  validates :image            , presence: true

  belongs_to :user
  has_one_attached :image
end
