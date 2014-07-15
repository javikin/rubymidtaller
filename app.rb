require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
enable :sessions

class Post < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5 }
 	validates :body, presence: true
end

helpers do
  def title
    if @title
      "#{@title}"
    else
      "Segun taller de RubyMid"
    end
  end
end

get "/" do
  @posts = Post.order("created_at DESC")
  @title = "Segun taller de RubyMid"
  erb :"index"
end


get "/posts/create" do
 @title = "Create post"
 @post = Post.new
 erb :"posts/create"
end

get "/posts/:id" do
	@post = Post.find(params[:id])	
	erb :"posts/view"
end

post "/posts" do
 @post = Post.new(params[:post])
 if @post.save
   redirect "posts/#{@post.id}", :notice => 'Has logrado crear 
   el post con exito yeeeiiii'
 else
   redirect "posts/create", :error => 'Algo esta mal intenta nuevamente'
 end
end


get "/posts/:id/edit" do
  @post = Post.find(params[:id])
  @title = "Editar Post"
  erb :"posts/edit"
end

put "/posts/:id" do
  @post = Post.find(params[:id])
  @post.update(params[:post])
  redirect "/posts/#{@post.id}"
end





