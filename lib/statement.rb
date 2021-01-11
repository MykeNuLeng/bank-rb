require 'money'

class Statement
  DISPLAY_HEADER = 'date || credit || debit || balance'.freeze
  I18n.enforce_available_locales = false

  def initialize(account: )
    @account = account
    @output_array = []
  end

  def display_statement
    format_account
    n = 0
    while n < 3 do
      individual_transaction = []
      @account.history.each { |_, data_arr|
        individual_transaction << data_arr[n]
      }
      @output_array << individual_transaction.join(" || ")
      n += 1
    end
    statement_formatting
  end

  private

  def format_account
    @account.history.map { |account_variable, data_arr|
      data_arr.map! { |data| money_format(data) unless debit_or_credit_is_zero(account_variable, data) } unless account_variable == :date
    }
  end

  def debit_or_credit_is_zero(account_variable, data)
    (account_variable == :debit || :credit) && data == 0
  end

  def money_format(money)
    Money.new(money, :gbp).format.delete(",").delete("£")
  end

  def statement_formatting
    @output_array << DISPLAY_HEADER
    output_string = @output_array.reverse.join("\n")
    output_string.split(" 0 ").join(" ").split("  ").join(" ")
  end
end
