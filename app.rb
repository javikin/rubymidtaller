require 'sinatra'

get "/" do
  @title = "Segun taller de RubyMid"
  erb :"index"
end

