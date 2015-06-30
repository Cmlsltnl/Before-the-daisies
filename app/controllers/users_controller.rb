class UsersController < ApplicationController


  def index
    @show_stuff = current_user.items.all
    @friends_stuff = current_user.friends
  end

  def show
    @user = User.find_by(username: params[:username])
  end


end
