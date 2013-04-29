class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :receipt_number
      t.string :purchase_date_time

      t.timestamps
    end
  end
end
