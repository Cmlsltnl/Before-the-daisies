class UsersController < ApplicationController

  def index

    config = {
      consumer_key: ENV['twitter_key'],
      consumer_secret: ENV['twitter_secret']
    }
    client = Twitter::REST::Client.new(config)
    #@tweets = client.get_all_tweets("thebradhimself")
    @show_stuff = current_user.items.all
    @friends_stuff = current_user.friends
  end

  def show
    @user = User.find_by(username: params[:username])
  end



end
