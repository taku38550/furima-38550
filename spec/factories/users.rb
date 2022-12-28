FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {"test@test.com"}
    password {"t1t1t1"}
    family_name {"田中"}
    first_name {"太郎"}
    family_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birth_day {"2020-01-01"}
  end
end