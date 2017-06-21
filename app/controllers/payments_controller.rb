class PaymentsController < ApplicationController
  before_action :authenticate_admin!
  http_basic_authenticate_with name: "duh", password: "secret", except: [:index, :show]
  def create
    @pawn = Pawn.find(params[:pawn_id])
    @payment = @pawn.payments.create(payment_params)
    redirect_to pawn_path(@pawn)
  end

  def destroy
    @pawn = Pawn.find(params[:pawn_id])
    @payment = @pawn.payments.find(params[:id])
    @payment.destroy
    redirect_to pawn_path(@pawn)
  end

  private
    def payment_params
      params.require(:payment).permit(:customer_name, :date, :amount)
    end
end
