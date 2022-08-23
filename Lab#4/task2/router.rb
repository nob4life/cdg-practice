module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp

      break if verb == 'q'

      action = nil
      case verb
      when 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        if action == "show"
          print 'Enter post number / q to exit: '
          index = gets.chomp
          if /\d+/.match(index)
            index = index.to_i   
          else
            puts "This is not a number '#{index}'."   
          end
        end
        break if action == 'q'
      when 'POST'
          action = 'create'
          print 'Enter post text / q to exit: '
          text = gets.chomp
          break if action == 'q'
      when 'PUT'
          action = 'update'
          puts "Enter post number to replace"
          number = gets.chomp.to_i
          print 'Enter post text / q to exit: '
          replace = gets.chomp
          break if action == 'q'         
      when 'DELETE'
          action = 'destroy'
          print 'Enter post number to delete / q to exit: '
          delet = gets.chomp.to_i
          break if action == 'q'    
      end

      case action 
      when nil?
        routes[verb].call
      when 'index'
        routes[verb][action].call
      when 'show'
        routes[verb][action].call(index)
      when 'create'
        routes[verb].call(text)
      when 'update'
        routes[verb].call(number,replace)
      when 'destroy'
        routes[verb].call(delet)
      end
    end
  end
end

class PostsController
  extend Resource
  #attr_accessor :posts
 
  def initialize
    @posts = [:dda, "I woon" ,"wto"]
  end

  def index
    @posts.each_with_index do |key,index|
      puts "#{index}. #{key}"
    end
  end

  def show(id)
    @posts.each_with_index do |key,index|
      if id == index
      puts key
      end
    end
  end

  def create(text)
    @posts.push(text)
    @posts.each_with_index do |key,index|
      if key == text
        puts "#{index}. #{key}"
      end
    end
  end

  def update(id,text)
    @posts[id] = text
    @posts.each_with_index do |key,index|
      if index == id
      puts "#{index}. #{key}"
      end
    end
  end

  def destroy(id)
    @posts.delete_at(id)
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    
    resources(PostsController, 'posts')
    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp
      p "Not Found" if choise == '2' 
      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new
#post  = PostsController.new
#puts post.posts = "dsada"
router.init