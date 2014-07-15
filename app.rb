require 'sinatra'
require 'sinatra/activerecord'
require './environments'

get "/" do
  @title = "Segun taller de RubyMid"
  erb :"index"
end

