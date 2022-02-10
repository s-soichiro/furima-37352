FactoryBot.define do
  factory :order_delivery do
    token {"tok_12oj34oij1234oij14"}
    post_code {"123-1234"}
    prefectures_id {2}
    municipalities {"テスト"}
    adress {"テスト1-1"}
    building_name {"テストハウス"}
    tel_num {"09012341234"}
  end
end