class ChargesController < ApplicationController
  before_action :set_description

  def new
    @pawn = (params[:pawn])  
  end

  def thanks
  end

  def create
    @pawn = Pawn.find(params[:pawn])
    @amount = params[:amount].to_i
    if @amount <= @pawn.principle.to_i
      customer = StripeTool.create_customer(email: params[:stripeEmail], 
                                            stripe_token: params[:stripeToken])

      charge = StripeTool.create_charge(customer_id: customer.id, 
                                        amount: (@amount * 100),
                                        description: @description)

      @pawn.payments.create(customer_name: "tomato harry", date: "01/02/13", amount: @amount)
      @pawn.principle -= @amount
      @pawn.save

      redirect_to thanks_path
    else
      redirect_to new_charge_path(:pawn => @pawn), :flash => { :error => "Cannot pay more than the value of the pawn" }
    end
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


  def set_description
    @description = "Pay for your pawn"
  end  
end
