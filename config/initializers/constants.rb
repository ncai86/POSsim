MERCHANTS = ["lotte", 'testing']

VALID_PARAMETERS = [
                      { :param_name => "ReceiptNumber", :class => String, :length => 28 },
                      { :param_name => "GoodsType", :class => Fixnum, :length => 1 }
                    ]

#Enter in comma seperated hashes, indicating parameter name expected,
# class/data type of parameter expected and
# length(characters) of parameter expected

# e.g. { :param_name => "NewParameter", :class => String, :length => 10 }
#param_name = parameter name
#class = type of data
#length = number of character expected -- optional

#Test characters and optional length validation