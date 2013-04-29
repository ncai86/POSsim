class CreatePurchaseItems < ActiveRecord::Migration
  def change
    create_table :purchase_items do |t|
      t.references :receipt
      t.string :good_description
      t.text :detailed_description
      t.integer :quantity
      t.float :gross_amount
      t.boolean :is_luxury, default: 0

      t.timestamps
    end
  end
end
