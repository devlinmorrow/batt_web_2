require "sinatra"
require "sinatra/reloader"

require_relative "game_logic.rb"

enable :sessions

get "/play" do

  if params[:user_input]
    user_input = params[:user_input]
    grid_point = session[:game].convert_to_grid_point(user_input)

    if session[:game].input_not_in_correct_format?(user_input)
      @input_incorrect_format_message = "Input not in correct format."
    elsif session[:game].input_has_been_entered_previously?(grid_point)
      @input_previously_entered_message = "You've already tried that one, please try another."
    else
      if session[:game].hit?(grid_point)
        @hit_message = "You got one!"
        session[:game].hit_mechanics(grid_point)
        if session[:game].boat_sunk?(grid_point)
          @sunk_message = "And you sunk a boat!"
        end 
      else
        @miss_message = "Oops, you missed, pal!"
        session[:game].miss_mechanics(grid_point)
      end

      if session[:game].won?
        redirect "/win"
      elsif session[:game].lost?
        redirect "/lose"
      end
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
