# frozen_string_literal: true

require 'money'

# this formats a bank accounts data into a readable statement
class Statement
  DISPLAY_HEADER = 'date || credit || debit || balance'
  I18n.enforce_available_locales = false

  def initialize(account:)
    @account = account
    @output_array = []
  end

  def display_statement
    format_account_data
    output_string_formation
    statement_formatting
  end

  private

  def output_string_formation
    @account.history[:date].each_with_index do |_, index|
      individual_transaction = []
      @account.history.each do |_, data_arr|
        individual_transaction << data_arr[index]
      end
      @output_array << individual_transaction.join(' || ')
    end
  end

  def format_account_data
    @account.history.map do |account_variable, data_arr|
      next if account_variable == :date

      data_arr.map! do |data|
        money_format(data) unless debit_or_credit_is_zero(account_variable, data)
      end
    end
  end

  def debit_or_credit_is_zero(account_variable, data)
    (account_variable == :debit || :credit) && data.zero?
  end

  def money_format(money)
    Money.new(money, :gbp).format.delete(',').delete('£')
  end

  def statement_formatting
    @output_array << DISPLAY_HEADER
    output_string = @output_array.reverse.join("\n")
    output_string.split(' 0 ').join(' ').split('  ').join(' ')
  end
end
