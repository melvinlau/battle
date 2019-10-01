require "sinatra/base"
class Battle < Sinatra::Base

  enable :sessions

  get "/" do
    erb :index
  end

  # Use the POST method to store params in the session hash
  # then redirect to /play
  post "/names" do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect "/play"
  end

  # Use the GET method to store session data in instance variables
  get "/play" do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :play
  end

  get "/attack" do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :attack
  end



  #start server if ruby file executed directly
  run! if app_file == $0
end
