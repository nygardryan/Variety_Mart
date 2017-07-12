module PaymentsHelper
  def coins_to_cash(amount)
    return (amount.to_f / 100)
  end
  def cash_to_coins(amount)
    return (amount.to_f * 100)
  end
end
