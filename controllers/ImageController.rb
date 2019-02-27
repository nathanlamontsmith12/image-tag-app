class ImageController < ApplicationController 

	before '/new' do 

		# filter for logged in as ADMIN 

	end


	get '/' do 

		# later on will have to get this from the database 
		@img_url = ""

		erb :show_image
	end

	get '/new' do 

	end

end