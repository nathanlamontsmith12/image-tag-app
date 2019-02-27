class ImageController < ApplicationController 

	get '/' do 
		erb :new_image 
	end

end