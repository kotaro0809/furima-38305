FactoryBot.define do
  factory :item do
    item_name       {'しか'}
    description     {'しか'}
    category_id     {2}
    status_id       {2}
    shipping_fee_id {2}
    prefecture_id   {2}
    shipping_day_id {2}
    price           {1000}
    association :user
     
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end