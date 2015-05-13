require 'sinatra'
require 'sinatra/reloader'

set :num, rand(100)
set :guess_num, 5

get '/' do
  guess = params['guess'].to_i
  cheat = params['cheat']
  msg, color = guesses_left(guess)
  msg = cheat_mode(msg) if cheat
  erb :index, :locals => {:msg => msg, :color => color}
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
  else
    correct_num = settings.num
    reset_game
    ["You got it right!<br />The SECRET NUMBER is #{correct_num}", 'green']
  end
end

def guesses_left(guess)
  if settings.guess_num == 0
    reset_game
    ["You ran out of guesses!<br />There's a new secret number, try again!", 'saddlebrown']
  else
    settings.guess_num -= 1
    check_guess(guess)
  end
end

def cheat_mode(msg)
  msg + "<br />The SECRET NUMBER is #{settings.num}"
end

def reset_game
  settings.guess_num = 5
  settings.num = rand(100)
end
