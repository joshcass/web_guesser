require 'sinatra'
require 'sinatra/reloader'

class Generator
  attr_reader :num

  def initialize
    @num = rand(100)
  end
end

gen = Generator.new

get '/' do
  "The SECRET NUMBER is #{gen.num}"
end
