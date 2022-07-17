PERSONAL = "personal_date.txt"
RESULT = "result.txt"

def main
  file_data = File.read(PERSONAL).chomp.split("\n")
  age = file_data.map {|x| x[/\d+/]}.map {|x|x.to_i}
  name = file_data.map {|x| x[/[а-яА-ЯЁё]+\s[а-яА-ЯЁё]+/]}
  hash = name.zip(age).to_h
  count_personal = hash.count
  count_result = File.read(RESULT).chomp.split("\n").count

  while  count_personal > count_result 
    
    puts "Введите возраст участника: "
    request =  gets.chomp.to_i

    file_copy = File.read(RESULT).chomp.split("\n")  
    name_copy = file_copy.map {|x| x[/\d+/]}.map {|x|x.to_i}


    if request == -1 
      return File.foreach(RESULT){|student| puts student}
    elsif name_copy.include?(request)
      next
    else
      hash.each do |key, value|
        if request == value
          result = "#{key} #{value} "
          file =  File.open(RESULT,'a')
          file.puts(result)
          file.close
          count_result +=1
        end
      end
    end
  end
  File.foreach(RESULT){|student| puts student}
end
p main