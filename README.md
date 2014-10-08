Day 13 Assignment
=================

Use MiniTest to create a Currency and CurrencyConverter class.

* I should be able to take 15 dollars, and convert to number of Euros, Yen, Pounds, and Gold.
* The conversion rates can be found googling google like 1 dollar in euro
* Create using test driven design
* Red, Green, Refactor

1. Red: watch it break | write a failing test
2. Green: Make it work | make the test pass
3. Refactor: Make it better | make code better. Stay Green. make test better. Stay Green.


Example usage


```ruby
CurrencyConverter.new(15, :dollar => :euro)
=> 11.82 Euro
```
