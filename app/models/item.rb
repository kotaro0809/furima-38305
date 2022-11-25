class Item < ApplicationRecord
  #Active StorageのテーブルとItemsテーブルのアソシエーションを定義
  has_one_attached :image

  #アソシエーション
  belongs_to :user
end
