require "sinatra"
require "sinatra/reloader"

require_relative "game_logic.rb"

enable :sessions

get "/play" do

  if params[:user_input]
    input = params[:user_input].to_i - 1

    if session[:game].hit?(input)
      @hit_message = "You got one!"
      session[:game].hit_mechanics(input)
      if session[:game].boat_sunk?(input)
        @sunk_message = "And you sunk a boat!"
      end 
    else
      @miss_message = "Oops, you missed, pal!"
      session[:game].miss_mechanics(input)
    end

    if session[:game].won?
      redirect "/win"
    elsif session[:game].lost?
      redirect "/lose"
    end

  else 
    session[:game] = BattleshipsGame.new
  end

  @visual_grid = session[:game].grid.grid_points.dup
  @visual_grid.insert(5,"<br>")
  @visual_grid.insert(11,"<br>")
  @visual_grid.insert(17,"<br>")
  @visual_grid.insert(23,"<br>") 

  @game_message = "You have #{session[:game].guesses_left} guesses left to hit #{session[:game].boats_left?} boats."

  erb :play
end

get "/win" do
  erb :win
end

get "/lose" do
  erb :lose
end
