def greeting
  puts "Введите свое имя:"
  name = gets.chomp
  puts "Введите свою фамилию:"
  fimale = gets.chomp
  puts "Введите свой возраст:"
  age = gets.to_i
  if age < 18
    puts "Привет #{name} #{fimale}. Тебе меньше 18,но начать учиться программировать нигода не рано"
  elsif age >= 18
    puts "Привет #{name } #{fimale}. Самое время заняться делом!"
  end
end

def foobar(num1,num2)
  if num1 == 20 || num2 == 20
    return num2
  else
    result = num1 + num2
  end
end
