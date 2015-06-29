class UsersController < ApplicationController


  def index
    @show_stuff = Item.all
  end

  def show
    @user = User.find_by(username: params[:username])
  end


end
