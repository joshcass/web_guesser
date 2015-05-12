require 'sinatra'
require 'sinatra/reloader'

set :num, rand(100)
@@guess_num = 5

get '/' do
  guess = params['guess'].to_i
  msg, color = guess_number(guess)
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
    guess_reset
    ["You got it right!<br />The SECRET NUMBER is #{settings.num}", 'green']
  end
end

def guess_number(guess)
  if @@guess_num > 0
    @@guess_num -= 1
    check_guess(guess)
  elsif @@guess_num == 0
    guess_reset
    ["You ran out of guesses!<br />There's a new secret number, try again!", 'brown']
  end
end

def guess_reset
  @@guess_num = 5

end
