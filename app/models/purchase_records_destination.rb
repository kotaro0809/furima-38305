class PurchaseRecordsDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phon_number, :token
  
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phon_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token
    
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}


  def save
    # 購入記録を保存し、purchase_recordに代入
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # purchase_record_idには、変数purchase_recordのidと指定する
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phon_number: phon_number, purchase_record_id: purchase_record.id)
  end
end