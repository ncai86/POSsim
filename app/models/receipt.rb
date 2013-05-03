class Receipt < ActiveRecord::Base
  has_many :purchase_items, :dependent => :destroy
  attr_accessible :detailed_description, :good_description, :gross_amount, :is_luxury, :purchase_date_time, :receipt_number, :quantity

#  setter
  def purchase_date_time=(purchase_date_time)
    write_attribute(:purchase_date_time, purchase_date_time.to_datetime.strftime("%FT%T"))
  end

#  instance methods
  def create_items(item_count)
    item_count.times do
      self.purchase_items.create(
          good_description: Faker::Lorem.word,
          detailed_description: Faker::Lorem.sentence,
          quantity: Random.rand(0..9),
          gross_amount: Random.rand(1000..10000),
          vat_rate: Random.rand(1.00..10.00).round(2),
          is_luxury: Random.rand(0..1)
      )
    end
  end
end
