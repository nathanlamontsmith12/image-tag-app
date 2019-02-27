require 'sinatra/base'

# controllers: 
require './AdminController.rb'
require './ApplicationController.rb'
require './TagController.rb'
require './ImageController.rb'

# models: 
require './models/AdminModel'
require './models/ImageModel'
require './models/TagController'

# maps: 
map ('/') {
	run ApplicationController
}

map ('/admin') {
	run AdminController 
}

map ('/TagController') {
	run TagController
}