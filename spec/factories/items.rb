FactoryBot.define do
  factory :item do
    image           {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.png'), 'image/png')}
    name            {Faker::Name.initials(number: 5)}
    description     {Faker::Lorem.sentence}
    price           {rand(300..9999999)}
    shipping_fee_id {rand(1..2)}
    category_id     {rand(1..10)}
    condition_id    {rand(1..6)}
    prefecture_id   {rand(1..47)}
    duration_id     {rand(1..3)}
    association :user
  end
end
