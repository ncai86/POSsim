FactoryGirl.define do
  factory :receipt do
    receipt_number { '123123123'}
    #receipt_number { Faker::Lorem.characters(35) }
    purchase_date_time { Random.rand(10..20000).minutes.from_now.strftime("%FT%T") }
    after(:build) do |receipt|
      receipt.purchase_items << FactoryGirl.create(:purchase_item)
    end
  end
end