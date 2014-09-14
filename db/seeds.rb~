# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create sample merchants 
puts "creating sample merchants.."
sample_merchants = [{:name =>"FlipKart", :fixed_rate => 2, :min_rate_amt => 10, :max_rate_amt => 50},
                    {:name =>"SnapDeal", :fixed_rate => 4, :min_rate_amt => 7, :max_rate_amt => 30},
                    {:name =>"Amazon", :fixed_rate => 3, :min_rate_amt => 5, :max_rate_amt => 20}  
                   ]
sample_merchants.each {|m| Merchant.create m}

cash = {:name => "Cash", :rate => 1.5}
credit = {:name => "Credit Card", :rate => 2.5}
debit = {:name => "Debit Card", :rate => 2}
                      
# create merchants payment methods
puts "creating payment methods.." 
Merchant.find_each do |merchant|
  merchant.cash_method = PaymentMethod::Cash.create cash
  merchant.credit_method = PaymentMethod::CreditCard.create credit
  merchant.debit_method = PaymentMethod::DebitCard.create debit
  merchant.save
end
