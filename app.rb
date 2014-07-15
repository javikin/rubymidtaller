require 'sinatra'
require 'sinatra/activerecord'
require './environments'

class Post < ActiveRecord::Base

end

get "/" do
	@posts = Post.order("created_at DESC")
  	@title = "Segun taller de RubyMid"
	erb :"index"
end

get '/posts/create' do
	@title = "Nuevo Post"
	@post = Post.new
	erb :"posts/create"
end

get "/posts/:id" do
	@post = Post.find(params[:id])	
	erb :"posts/view"
end