MERCHANTS = []

#Enter in comma seperated hashes, indicating parameter name expected,
# class/data type of parameter expected and
# length(characters) of parameter expected

# e.g. { :param_name => "NewParameter", :class => String, :length => 10 }
#param_name = parameter name
#class = type of data
#length = number of character expected -- optional

VALID_PARAMETERS = [
                      { :param_name => "ReceiptNumber", :class => String, :length => 28 }
                      # { :param_name => "GoodsType", :class => Fixnum, :length => 1 },
                      # { :param_name => "ExampleDate", :class => DateTime, :length => 8 }
                    ]

# Parameters that are present in the request but not needed/checked
REDUNDANT_REQUEST_PARAMS = ["xmlns:xsi", "xmlns:xsd", "CorpID", "StoreID"]

# Nodes of purchase items present/wanted in the response xml
RESPONSE_NODES = ['GoodDescription', 'DetailedDescription', 'Quantity', 'GrossAmount', 'VatRate', 'IsLuxury']

# Query assigning the array of purchase_items -- @purchase_items 
QUERY_STRING = "@receipt = Receipt.find_by_receipt_number(@receipt_number); (luxury_filter.present? ? @receipt.purchase_items.where(:is_luxury => luxury_filter) : @receipt.purchase_items) if @receipt"
