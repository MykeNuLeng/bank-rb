class Account

  attr_reader :history

  def initialize
    @history = {
      :date => [],
      :credit => [],
      :debit => [],
      :balance => []
    }
  end

  def deposit(deposit_amount_in_pence)
    @history[:date] << Time.new.strftime("%d/%m/%Y")
    @history[:credit] << deposit_amount_in_pence
    @history[:debit] << 0
    @history[:balance].empty? ? @history[:balance] << deposit_amount_in_pence : @history[:balance] << @history[:balance][-1] + deposit_amount_in_pence
  end

  def withdraw(withdrawal_amount_in_pence)
    @history[:date] << Time.new.strftime("%d/%m/%Y")
    @history[:credit] << 0
    @history[:debit] << withdrawal_amount_in_pence
    @history[:balance].empty? ? @history[:balance] << withdrawal_amount_in_pence : @history[:balance] << @history[:balance][-1] - withdrawal_amount_in_pence
  end
end
