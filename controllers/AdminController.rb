class AdminController < ApplicationController	

	get '/' do 
		redirect '/'
	end

	get "/login" do 
		erb :admin_login
	end

	get "/register" do 
		erb :admin_register 
	end

	post '/login' do 
		# check login 
		
		erb :new_image 
	end

	post '/register' do 
		redirect '/image/new' 
	end

end