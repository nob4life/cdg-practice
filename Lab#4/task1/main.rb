class CashMachine
  BALANCE = "balance.txt"
  attr_accessor :balance
  def init
    @balance  = File.read(BALANCE).chomp.to_i

    while true    
      puts "Для внесение средст на счет введите 'D'"
      puts "Для вывода средст введите 'W'"
      puts "Для проверки баланса счета введите 'B'"
      puts "Для выхода введите 'Q'"
      char = gets.chomp.downcase
      if char == "d" || char == "w" || char == "b" || char == "q"
        case char
          when "d" 
            deposit()
          when "w"
            withdrow()
          when "b"
            p "Ваш баланс: #{@balance}"
          when "q"
            return File.write(BALANCE, @balance)
          end
      else
        puts "Введена неизвестная команда.", "Пожалуйста введите команду из списка!"
      end
    end
  end
  
  def withdrow
    puts "Введите сумму cнятие: "
    cash = gets.chomp.to_i
    if cash <= @balance && cash > 0
      @balance -= cash
      p "Ваш баланс: #{@balance}" 
    elsif cash > @balance
      puts "Сумма должа быть меньше текущего баланса."
    elsif cash <= 0
      puts "Сумма должа быть больше нуля."
    else
      puts "Введите числовую последовательность."
    end
  end
  
  def deposit
    puts "Сумма должа быть больше нуля."
    puts "Введите сумму пополнения баланса: "
    dep = gets.chomp.to_i
    if dep > 0
      @balance +=dep
      p "Ваш баланс: #{@balance}"
    elsif dep <= 0
      puts "Сумма должа быть больше нуля."
    else
      puts "Введите числовую последовательность."
    end
  end

end
a = CashMachine.new
a.init