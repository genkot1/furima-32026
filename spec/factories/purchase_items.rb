FactoryBot.define do
  factory :purchase_item do
    token {"tok_abcdefghijk00000000000000000"}
    user_id {10}
    item_id {15}
    postal_code {'123-4567'}
    prefecture_id {rand(1..47)}
    city {'大阪市'}
    house_number {'天王寺区石ケ辻1-2-3'}
    building_name {'上町ハイツ123'}
    phone_number {'09012345678'}
  end
end
