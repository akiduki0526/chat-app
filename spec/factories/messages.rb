FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      #テスト画像の読み込み(インスタンス変数：messageが生成された後に読み込む)
    end
  end
end