require 'sinatra'
require 'sinatra/activerecord'


get "/" do
  @title = "Segun taller de RubyMid"
  erb :"index"
end

