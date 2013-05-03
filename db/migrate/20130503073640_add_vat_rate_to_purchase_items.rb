class AddVatRateToPurchaseItems < ActiveRecord::Migration
  def change
    add_column :purchase_items, :vat_rate, :float
  end
end
