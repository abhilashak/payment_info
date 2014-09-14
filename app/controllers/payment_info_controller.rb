class PaymentInfoController < ApplicationController
  before_filter :find_merchant

  # GET /payment_info/calculate 
  def calculate
    if @merchant
      render :json => @merchant.find_rate(params[:pay_method], params[:prod_val])
    else
      render :json => {:stauts => {"Error" => "Merchant Not Found"}}
    end
  end

  private

  def find_merchant
    @merchant = Merchant.find_by_id params[:merch_id]
  end 

end
