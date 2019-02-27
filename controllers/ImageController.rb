class ImageController < ApplicationController 

	before ['/new', '/submit'] do 
		if not (session[:logged_in] and session[:admin]) 
			session[:message] = "You must have administrator access to do that!"
		end
	end


	get '/' do 
		# get a random image url from database  
		rand_image = Image.all.sample 

		@image_url = rand_image.image_url
		@image_id = rand_image.id 

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


	post '/:id' do 
		new_tag = Tag.new 
		new_tag.image_id = params[:id] 
		new_tag.image_tag = params[:tag]

		new_tag.save 

		redirect '/image'
	end

end

