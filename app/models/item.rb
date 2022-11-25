class Item < ApplicationRecord
  #Active StorageのテーブルとItemsテーブルのアソシエーションを定義
  has_one_attached :image

  #アソシエーション
  belongs_to :user

  #ActiveHashアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  
  #ActiveHashバリデーション
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
