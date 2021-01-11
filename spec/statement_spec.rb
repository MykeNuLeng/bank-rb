# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:account1) do
    double :account, history: {
      date: ['10/01/2012', '13/01/2012', '14/01/2012'],
      credit: [100_000, 200_000, 0],
      debit: [0, 0, 50_000],
      balance: [100_000, 300_000, 250_000]
    }
  end

  let(:account2) do
    double :account, history: {
      date: ['31/01/2020', '25/09/2020'],
      credit: [10_000, 20_000],
      debit: [0, 0],
      balance: [10_000, 30_000]
    }
  end

  let(:account3) do
    double :account, history: {
      date: [],
      credit: [],
      debit: [],
      balance: []
    }
  end

  subject(:test_statement1) { Statement.new(account: account1) }
  subject(:test_statement2) { Statement.new(account: account2) }
  subject(:test_statement3) { Statement.new(account: account3) }

  it 'An empty bank acount will just have the header as the output' do
    expect(test_statement3.display_statement).to eq 'date || credit || debit || balance'
  end

  it 'Will have the correct output according to the acceptance criterea.' do
    expect(test_statement1.display_statement).to eq([
      'date || credit || debit || balance',
      '14/01/2012 || || 500.00 || 2500.00',
      '13/01/2012 || 2000.00 || || 3000.00',
      '10/01/2012 || 1000.00 || || 1000.00'
    ].join("\n"))
  end

  it 'Will have the correct output for account2' do
    expect(test_statement2.display_statement).to eq([
      'date || credit || debit || balance',
      '25/09/2020 || 200.00 || || 300.00',
      '31/01/2020 || 100.00 || || 100.00'
    ].join("\n"))
  end
end
