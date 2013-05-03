object @receipt => 'ReceiptResponse'
attribute :receipt_number => 'ReceiptNumber', :purchase_date_time => 'PurchaseDateTime'

child @purchase_items => 'PurchaseItems' do
  node 'GoodDescription' do |p|
    p.good_description
  end
  node 'DetailedDescription' do |p|
    p.detailed_description
  end
  node 'Quantity' do |p|
    p.quantity.to_s
  end
  node 'GrossAmount' do |p|
    p.gross_amount.to_s
  end
  node 'VatRate' do |p|
    p.vate_rate.to_s
  end
  node 'IsLuxury' do |p|
    p.is_luxury.to_s
  end
end
