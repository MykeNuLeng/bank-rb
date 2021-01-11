# frozen_string_literal: true

# bank account that can withdraw and deposit money
class Account
  attr_reader :history

  def initialize
    @history = {
      date: [],
      credit: [],
      debit: [],
      balance: []
    }
  end

  def deposit(amount)
    @history[:date] << Time.new.strftime('%d/%m/%Y')
    @history[:credit] << amount
    @history[:debit] << 0
    @history[:balance] << if @history[:balance].empty?
                            amount
                          else
                            @history[:balance][-1] + amount
                          end
  end

  def withdraw(amount)
    @history[:date] << Time.new.strftime('%d/%m/%Y')
    @history[:credit] << 0
    @history[:debit] << amount
    @history[:balance] << if @history[:balance].empty?
                            amount
                          else
                            @history[:balance][-1] - amount
                          end
  end
end
