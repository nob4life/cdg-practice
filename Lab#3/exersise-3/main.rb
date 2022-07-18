BALANCE = "balance.txt"

def online_banking

  while true
    @count  = File.read(BALANCE).chomp.to_i
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
          p "Ваш баланс: #{File.read(BALANCE).chomp.to_i}" #balance
        when "q"
        return # quit
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
    File.write(BALANCE, @count - cash)
    p "Ваш баланс: #{File.read(BALANCE).chomp.to_i}" 
  else
    puts "Сумма должа быть больше нуля и меньше текущего баланса."
  end
end

def deposit
  puts "Введите сумму пополнения баланса: "
  puts "Для пополнения на 100 введите 1"
  puts "Для пополнения на 200 введите 2"
  puts "Для пополнения на 500 введите 5"
  puts "Для пополнения на 1000 введите 10"
  puts "Для пополнения на другую сумму введите 9"
  dep = gets.chomp.to_i
  if dep == 1 || dep == 2 || dep == 5 || dep == 10 || dep == 9
    case dep
      when 1
        File.write(BALANCE, @count + 100)
        p "Ваш баланс: #{File.read(BALANCE).chomp.to_i}"
      when 2
        File.write(BALANCE, @count + 200)
        p "Ваш баланс: #{File.read(BALANCE).chomp.to_i}"
      when 5
        File.write(BALANCE, @count + 500)
        p "Ваш баланс: #{File.read(BALANCE).chomp.to_i}"
      when 10
        File.write(BALANCE, @count + 1000)
        p "Ваш баланс: #{File.read(BALANCE).chomp.to_i}"
      when 9
        puts "Введите сумму пополнения:"
        up = gets.chomp.to_i
        if up <= 0
          puts "Введите положительное число."
        else
          File.write(BALANCE, @count + up)
          p "Ваш баланс: #{File.read(BALANCE).chomp.to_i}"
        end
    end
  else 
    puts "Введена неизвестная команда.", "Пожалуйста введите команду из списка!"
  end 
end
online_banking