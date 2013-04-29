class Receipt < ActiveRecord::Base
  has_many :purchase_items
  attr_accessible :detailed_description, :good_description, :gross_amount, :is_luxury, :purchase_date_time, :receipt_number, :quantity
end
