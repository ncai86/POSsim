# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


##### POS Simulator Test Data Sets
receipt = Receipt.create receipt_number: '02111112590010007000194', purchase_date_time: DateTime.now.strftime("%FT%T")
receipt.purchase_items.create(good_description: 'Watch',  detailed_description: 'Omega', quantity: 1, is_luxury: 1)

