# frozen_string_literal: true

require 'account'

describe Account do
  context 'depositing £1' do
    before do
      subject.deposit(100)
    end

    it 'Depositing £1 into a new account will reflect that in the credit history' do
      expect(subject.history[:credit]).to include 100
    end

    it 'Depositing £1 into a new account will add the date to the transaction' do
      expect(subject.history[:date]).to include Time.new.strftime('%d/%m/%Y')
    end

    it 'Depositing £1 into a new account will add 0 to the debit history' do
      expect(subject.history[:debit]).to include 0
    end

    it 'Depositing £1 into an account will make the balance 100' do
      expect(subject.history[:balance]).to include 100
    end

    context 'Withdrawing 50p' do
      before do
        subject.withdraw(50)
      end

      it 'A new date will be added' do
        expect(subject.history[:date][-1]).to eq Time.new.strftime('%d/%m/%Y')
      end

      it 'The most recent credit will be 0' do
        expect(subject.history[:credit][-1]).to eq 0
      end

      it 'The most recent debit will be 50' do
        expect(subject.history[:debit][-1]).to eq 50
      end

      it 'The balance will be 50' do
        expect(subject.history[:balance][-1]).to eq 50
      end
    end
  end
end
