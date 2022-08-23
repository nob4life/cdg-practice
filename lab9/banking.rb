class CashMachine
  BALANCE = "balance.txt"
  attr_accessor :balance
  def initialize
    @balance  = File.read(BALANCE).chomp.to_i
  end
  
  def withdraw(cash)
    cash = cash.to_i
    if cash <= @balance && cash > 0
      @balance -= cash
      File.write(BALANCE, @balance)
      p "Your balance: #{@balance}" 
    elsif cash > @balance
      p "The amount must be less than the public balance.."
    else
      p "The amount must be greater than zero."
    end
  end
  
  def deposit(dep)
    dep =dep.to_i
    if dep > 0
      @balance +=dep
      File.write(BALANCE, @balance)
      p "Your balance: #{@balance}"
    else dep <= 0
      p "The amount must be greater than zero."
    end
  end
end