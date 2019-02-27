class AdminController < ApplicationController	

	get '/' do 
		redirect '/'
	end

	get "/#{ENV['ADMIN_SECRET']}" do 
		erb :admin_login
	end

	post '/login' do 
		# check login 
		
	end

end