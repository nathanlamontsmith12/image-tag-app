class ApplicationController < Sinatra::Base

	require 'bundler'
	Bundler.require()

	Dotenv.load

	require './config/environments'

	secret = ENV['SESSION_SECRET']

	use Rack::Session::Cookie, :key => 'rack.session', :path => '/', :secret => secret


	# CORS 
	register Sinatra::CrossOrigin

	configure do 
		enable :cross_origin 
	end

	set :allow_origin, :any 
	set :allow_methods, [:get, :post, :put, :options, :patch, :delete, :head]
	set :allow_credentials, true 


	# CORS options: 
	options "*" do 
    	response.headers["Allow"] = "HEAD,GET,PUT,PATCH,POST,DELETE,OPTIONS" 
    	response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    	200 # this is our status code -- it will be sent as response 
  	end


  	# Method override: 
	use Rack::MethodOverride 
	set :method_override, true
	

	# set path to views folder: 
	set :views, File.expand_path("../../views", __FILE__)

	# set path for static folder 
	set :public_dir, File.expand_path("../../public", __FILE__)


	get '/' do 
		erb :home
	end


	get '/test' do 

		binding.pry 

		redirect '/'

	end


	get '*' do 

		halt 404
		# could put a 404 page in there 

	end

end