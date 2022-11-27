FactoryBot.define do
  factory :user do
    nickname              { 'asasas' }
    email                 { 'test@example' }
    password              { 'ko0809ma' }
    password_confirmation { password }
    family_name           { '松永' }
    first_name            { '康太郎' }
    family_name_kana      { 'マツナガ' }
    first_name_kana       { 'コウタロウ' }
    birth_day             { '1997-8-9' }
  end
end
