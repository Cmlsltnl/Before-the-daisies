class FriendshipsController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      redirect_to index_path
    else
      render :new
    end
  end

  def destroy

    @friendy = Friendship.find(params[:id])
    @friend = @friendy.friend_id
    @friend = User.find(@friend)
    @friendy.destroy
    redirect_to user_path(@friend.username)
  end


  private
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
