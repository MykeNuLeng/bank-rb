# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:account) do
    double :account, history: {
      date: ['10/01/2012', '13/01/2012', '14/01/2012'],
      credit: [100_000, 200_000, 0],
      debit: [0, 0, 50_000],
      balance: [100_000, 300_000, 250_000]
    }
  end
  subject(:test_statement) { Statement.new(account: account) }
  it 'Will have the correct output according to the acceptance criterea.' do
    expect(test_statement.display_statement).to eq([
      'date || credit || debit || balance',
      '14/01/2012 || || 500.00 || 2500.00',
      '13/01/2012 || 2000.00 || || 3000.00',
      '10/01/2012 || 1000.00 || || 1000.00'
    ].join("\n"))
  end
end
