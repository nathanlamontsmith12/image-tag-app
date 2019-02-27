require 'sinatra/base'


# controllers: 
require './controllers/AdminController'
require './controllers/ApplicationController'
require './controllers/ImageController'


# models: 
require './models/AdminModel'
require './models/TagModel'
require './models/ImageModel'


# maps: 
map ('/') {
	run ApplicationController
}

map ('/image') {
	run ImageController
}

map ('/admin') {
	run AdminController 
}
