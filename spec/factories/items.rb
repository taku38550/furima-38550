FactoryBot.define do
  factory :item do
    name {"test"}
    description {"1年前に購入したものです"}
    category_id {2}
    status_id {2}
    shipping_cost_id {2}
    prefecture_id {2}
    shipping_date_id {2}
    price {"1111"}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
