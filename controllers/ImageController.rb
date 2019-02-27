class ImageController < ApplicationController 

	get '/' do 
		erb :show_image
	end

end