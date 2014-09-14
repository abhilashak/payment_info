class Merchant < ActiveRecord::Base
  attr_accessible :name, :fixed_rate, :min_rate_amt, :max_rate_amt  

  has_one :cash_method, :class_name => "PaymentMethod::Cash"
  has_one :credit_method, :class_name => "PaymentMethod::CreditCard"
  has_one :debit_method, :class_name => "PaymentMethod::DebitCard"
  

  def find_pay_method(method)
    case method
    when "Cash"
      return cash_method
    when "Credit" 
      return credit_method
    when "Debit"
      return debit_method
    else
      return nil
    end	
  end

  # checks rate is inside minimum and maximum value 
  def get_final_rate(default_rate)
    default_rate > max_rate_amt ? max_rate_amt : (default_rate < min_rate_amt ? min_rate_amt : default_rate)
  end
 
  # calclates the rate
  # @return Hash
  def find_rate(method, prod_val)
    #{:method => method, :prod_val => prod_val}
    pay_method = find_pay_method(method)
    if pay_method
      default_rate = ((prod_val.to_i *  pay_method.rate / 100) + fixed_rate)
      {:status => "Success", :rate => get_final_rate(default_rate)} 
    else
      return {:status => {"Error" => "Payment Method Not Found"}} 
    end 

  end

end
