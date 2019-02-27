class AdminController < ApplicationController	

	before ['/register'] do 
		# if not (session[:logged_in] and session[:is_admin]
		# 	session[:message] = "You must have administrator access to do that!"
		# end
	end


	get '/' do 
		redirect '/'
	end


	get "/login" do 
		erb :admin_login
	end


	get "/register" do 
		erb :admin_register 
	end


	get "/logout" do 
		session.destroy 
		session[:message] = "Logged out"
		redirect '/'
	end


	post '/login' do 
		
		admin = User.find_by username: params[:username]

		pw = params[:password]

		if not (admin and admin.authenticate(pw))
			session[:message] = "Failed to log in"
			redirect '/admin/login'
		else 
			session.destroy 
			session[:logged_in] = true 
			session[:username] = params[:username]
			session[:admin] = true 
			session[:message] = "Logged in as administrator #{admin.username}"
			
			redirect '/image/new' 		
		end
	end


	post '/register' do 

		# if params[:key] != ENV["ADMIN_KEY"].to_s 
		# 	session[:message] = "Incorrect Administrator Key"
		# 	redirect '/admin/register'
		# else 
		# 	new_admin = User.new 

		# 	new_admin.username = params[:username]
		# 	new_admin.password = params[:password]
		# 	new_admin.is_admin = true 

		# 	session[:message] = "Created new administrator"

		# 	redirect '/admin/login' 
		# end

		extant_user = User.find_by username: params[:username]

		if extant_user 
			session[:message] = "An admin with that username already exists!"
			redirect 'admin/register'
		end

		new_admin = User.new 

		new_admin.username = params[:username]
		new_admin.password = params[:password]
		new_admin.is_admin = true 

		new_admin.save 

		session[:message] = "Created new administrator"

		redirect '/admin/login' 
	end

end