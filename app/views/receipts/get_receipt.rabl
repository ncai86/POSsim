object @receipt => 'ReceiptResponse'
attribute :receipt_number => 'ReceiptNumber', :purchase_date_time => 'PurchaseDateTime'

child @purchase_items => 'PurchaseItems' do
  RESPONSE_NODES.each do |response_node|
    node response_node do |n|
      n.send("#{response_node.underscore}")
    end
  end
end
