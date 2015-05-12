require 'sinatra'
require 'sinatra/reloader'

set :num, rand(100)

get '/' do
  guess = params['guess'].to_i
  msg, color = check_guess(guess)
  erb :index, :locals => {:number => settings.num, :msg => msg, :color => color}
end

def check_guess(guess)
  if guess > settings.num + 5
    ['Way too high!', 'red']
  elsif guess > settings.num
    ['Too high!', 'salmon']
  elsif guess < settings.num - 5
    ['Way too low!', 'red']
  elsif guess < settings.num
    ['Too low!', 'salmon']
  else guess == settings.num
    ["You got it right!<br />The SECRET NUMBER is #{settings.num}", 'green']
  end
end
