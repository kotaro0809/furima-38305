class Item < ApplicationRecord
  #Active StorageのテーブルとItemsテーブルのアソシエーションを定義
  has_one_attached :image

  #アソシエーション
  belongs_to :user

  #ActiveHashアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  
  #ActiveHashバリデーション
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
