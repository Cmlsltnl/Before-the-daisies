class FriendshipsController < ApplicationController

  def index
  end

  def show
    @user = User.find_by(username: params[:username])
    @this_user_id = @user.id 
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(friendship_params)
    binding.pry
    if @friendship.save
      redirect_to index_path
    else
      render :new
    end

  end


  private
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end


end
