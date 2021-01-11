# Bank Tech Test!

## Specification

* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria
Given a client makes a deposit of 1000 on 10-01-2012,
and a deposit of 2000 on 13-01-2012,
and a withdrawal of 500 on 14-01-2012,
when she prints her bank statement,
then she would see:

date || credit || debit || balance

14/01/2012 || || 500.00 || 2500.00

13/01/2012 || 2000.00 || || 3000.00

10/01/2012 || 1000.00 || || 1000.00

## Method
* This problem was solved in a test driven manner using RSpec. 
* It was first separated into two classes, one is the account, and the other was responsible for returning the statement in the desired format.
* Rubocop was used to lint this code.
* The money gem was used to format currency. 
* Simple-cov was used for transparency on the test coverage. 
