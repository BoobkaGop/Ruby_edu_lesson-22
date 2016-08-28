require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]
	file = File.open "./public/users.txt", 'a'
	file.write "Username: #{@username}, phone: #{@phone}, date and time: #{@datetime}, barber: #{@barber}, color: #{@color} \n"
	file.close

	erb :visit
end

post '/contacts' do
	@contact = params[:contact]
	@message = params[:message]
	file = File.open "./public/contacts.txt", "a"
	file.write "Username: #{@contact}\nMessage:\n#{@message}\n\n"
	file.close

	erb :contacts
end