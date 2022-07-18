FILMS = "films.txt"
BUFFER = "buffer.txt"
def index
  File.foreach(FILMS){|film| puts film}
end

def find(id)
  File.foreach(FILMS).with_index do |film, index|
    @str = film if id == index
  end
  @str
end
def where(name)
  File.foreach(FILMS).with_index do |film, index|
    if film.include?(name)
      "Строка ##{index+1} Фильм - #{film}" 
    end
  end
end

def update(id,name)
  file = File.open(BUFFER, "w")
  File.foreach(FILMS).with_index do |film , index|
    file.puts(id == index ? name : film)
  end

  file.close
  File.write(FILMS, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  file_data = File.read(FILMS).split("\n")
  file_data.delete_at(id)
  result = file_data.join("\n")
  File.write(FILMS, result)
end

def create(name)
  file =  File.open(FILMS,'a')
  file.puts(name)
  file.close
end
#create("Batman")
puts update(3, "Macdonalds")
puts index