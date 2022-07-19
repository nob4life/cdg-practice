BALANCE = "balance.txt"

def online_banking
  @count  = File.read(BALANCE).chomp.to_i

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
          p "Ваш баланс: #{@count}"
        when "q"
        return File.write(BALANCE, @count)
        end
      else
        puts "Введена неизвестная команда.", "Пожалуйста введите команду из списка!"
      end
  end
end

def withdrow
  puts "Введите сумму cнятие: "
  cash = gets.chomp.to_i
  if cash <= @count && cash > 0
    @count -= cash
    p "Ваш баланс: #{@count}" 
  elsif cash > @count
    puts "Сумма должа быть меньше текущего баланса."
  elsif cash < 0
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
    @count +=dep
    p "Ваш баланс: #{@count}"
  elsif dep < 0
    puts "Сумма должа быть больше нуля."
  else
    puts "Введите числовую последовательность."
  end
end

online_banking