require 'sinatra'
require 'sinatra/reloader'

class Generator
  attr_reader :num

  def initialize
    @num = rand(100)
  end
end

number = Generator.new.num

get '/' do
  erb :index, :locals => {:number => number}
end
