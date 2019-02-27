class AdminController < ApplicationController	

	before ['/register'] do 
		if not (session[:logged_in] and session[:admin]) 
			session[:message] = "You must have administrator access to do that!"
		end
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
		# check login 
		
		admin = Admin.find_by params[:username]

		if not admin 
			session[:message] = "Failed to log in"
			redirect '/admin/login'
		end

		if not admin.is_admin? 
			session[:message] = "Failed to log in"
			redirect '/admin/login'
		end

		pw = params[:password]

		if admin.authenticate(pw) 
			session[:logged_in] = true 
			session[:username] = params[:username]
			session[:admin] = true 
			session[:message] = "Logged in as administrator #{admin.username}"
			erb :new_image 
		else 
			session[:message] = "Failed to log in"
			redirect '/admin/login'			
		end
	end

	post '/register' do 

		if params[:key] != ENV[:ADMIN_KEY] 
			session[:message] = "Incorrect Administrator Key"
			redirect '/admin/register'
		else 
			new_admin = Admin.new 

			new_admin.username = params[:username]
			new_admin.password = params[:password]
			new_admin.is_admin? = true 

			session[:message] = "Created new administrator"

			redirect '/admin/login' 
		end
	end

end