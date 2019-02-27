class ImageController < ApplicationController 

	before ['/new', '/submit'] do 

		# filter for logged in as ADMIN 

	end


	get '/' do 
		# later on will have to get this from the database 
		@img_url = ""

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