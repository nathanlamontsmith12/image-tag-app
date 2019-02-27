class ImageController < Sinatra::Base 

	get '/' do 
		erb :new_image 
	end

end