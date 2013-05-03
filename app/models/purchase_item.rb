class PurchaseItem < ActiveRecord::Base
  belongs_to :receipt

  attr_accessible :good_description, :detailed_description, :quantity, :gross_amount, :vat_rate, :is_luxury
  # attr_accessible :title, :body
end
