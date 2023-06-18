FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '隆太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' }
    birthday              { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end
