FactoryBot.define do
  factory :purchase_order do
    token              {"tok_abcdefghijk00000000000000000"}
    post_number        {"123-4567"}
    prefecture_id      {2}
    city               {"横浜市"}
    address            {"青山1-1-1"}
    building_name      {"サンプルビル 72階"}
    telephone_number   {"08008080808"} 
  end
end
