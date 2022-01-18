FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {"陸太郎"}
    last_name {"山田"}
    first_name_kana {"リクタロウ"}
    last_name_kana {"ヤマダ"}
    birth_date {1987-02-23}
  end
end
