class PaymentMethod::Cash < PaymentMethod::Base
  belongs_to :merchant
end
