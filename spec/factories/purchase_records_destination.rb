FactoryBot.define do
  factory :purchase_records_destination do
    city { Faker::Address.city }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    address { Faker::Address.street_address }
    building { Faker::Address.street_address }
    phon_number { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
    post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) } 
  end
end
