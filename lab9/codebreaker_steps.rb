# -*- encoding : utf-8 -*-
require 'socket'
require 'rack'
require 'rack/utils'
require './banking'

server = TCPServer.new('0.0.0.0', 3000)

class App

  def initialize
    @a = CashMachine.new
  end
	def call(env)
		req = Rack::Request.new(env)
		
		case req.path
		when '/balance'
			[200, {'Content-Type' => 'text/html'}, ["Your balance: #{@a.balance}"]]
		when '/withdraw'
			[200, {'Content-Type' => 'text/html'}, ["#{@a.withdraw($values)}"]]
    when '/deposit'
			[200, {'Content-Type' => 'text/html'}, ["#{@a.deposit($values)}"]]
		else
			[404, {'Content-Type' => 'text/html'}, ["Not found"]]
		end
	end
end

app = App.new

while connection = server.accept
  request = connection.gets
  method, full_path = request.split(' ')
  path = full_path.split('?')[0]
  $values = full_path.split('=')[1]
  
  status, headers, body = app.call({
    'REQUEST_METHOD' => method,
    'PATH_INFO' => path
  })
  p headers
  p body
  p $values

 
  connection.print("HTTP/1.1 #{status}\r\n")

  headers.each { |key, value|  connection.print("#{key}: #{value}\r\n") }

  connection.print "\r\n"

  body.each { |part| connection.print(part) }

  connection.close
end