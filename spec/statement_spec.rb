require 'statement'

describe Statement do
  let(:account) { double :account, history: {
    :date => ['10/01/2012', '13/01/2012','14/01/2012'],
    :credit => [100000, 200000, 0],
    :debit => [0, 0, 50000],
    :balance => [100000, 300000, 250000]
     }
   }
   subject(:test_statement) { Statement.new(account: account) }
  it 'Will have the correct output according to the acceptance criterea.' do
    expect(test_statement.display_statement).to eq([
      'date || credit || debit || balance',
      '14/01/2012 || || 500.00 || 2500.00',
      '13/01/2012 || 2000.00 || || 3000.00',
      '10/01/2012 || 1000.00 || || 1000.00'].join("\n"))
  end
end
