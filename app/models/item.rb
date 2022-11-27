class Item < ApplicationRecord
  # Active StorageのテーブルとItemsテーブルのアソシエーションを定義
  has_one_attached :image

  # アソシエーション
  belongs_to :user

  # ActiveHashアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  # ActiveHashバリデーション
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }

  # バリデーション
  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :user_id
    validates :image
  end

  # priceバリデーション
  with_options presence: true,
               numericality: { only_integer: true, greater_than_or_equal_to: 300,
                               less_than_or_equal_to: 9_999_999 } do
    validates :price
  end
end
