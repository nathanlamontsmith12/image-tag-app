class ImageController < ApplicationController 

	before ['/new', '/submit'] do 
		if not (session[:logged_in] and session[:admin]) 
			session[:message] = "You must have administrator access to do that!"
		end
	end


	get '/' do 
		random_id = rand(Image.count) 

		if random_id 
			@image_url = Image.find random_id 
		else 
			@image_url = ""
		end

		erb :show_image
	end


	get '/new' do 
		erb :new_image 
	end


	post '/submit' do 
		@image_url = params[:image_url]

		erb :submit_image
	end


	post '/new' do 
		image = Image.new 
		image.image_url = params[:image_url]
		image.save 

		session[:message] = "Successfully added image!"

		redirect '/image/new'
	end


end