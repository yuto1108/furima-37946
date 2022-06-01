FactoryBot.define do
  factory :item do
    name               {Faker::Lorem.sentence}
    content            {Faker::Lorem.sentence}
    category_id        {2}
    situation_id       {2}
    delivery_charge_id {2} 
    prefecture_id      {2}
    delivery_date_id   {2}
    price              {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end