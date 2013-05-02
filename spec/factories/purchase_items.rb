FactoryGirl.define do
  factory :purchase_item do
    good_description { 'test' }
    detailed_description { 'detailed description' }
    quantity { Random.rand(10..20000) }
    gross_amount { Random.rand(1.00..999.99).round(2) }
    is_luxury { Random.rand(0..1) }
  end
end