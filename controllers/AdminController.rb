class AdminController < Sinatra::Base	

	get '/' do 
		redirect '/'
	end

	get "/#{ENV['ADMIN_SECRET']}" do 
		erb :admin_login
	end

end