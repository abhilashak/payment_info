class PaymentMethod::Base < ActiveRecord::Base
  set_table_name :payment_methods
  attr_accessible :name, :rate
  
end
