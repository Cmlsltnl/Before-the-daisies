class CommentsController < ApplicationController

  # def create
  #   @item = Item.find(params[:item_id])
  #   @comment = @item.comments.create
  #   redirect_to item_path(@item)
  # end

  # def destroy
  #   @item = Item.find(params[:item_id])
  #   @comment = @item.comments.find(params[:id])
  #   @comment.destroy
  #   redirect_to item_path(@item)
  # end


before_action :authenticate_user!
before_action :find_item

  def new
    @comment = @item.comments.new
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      redirect_to @item, notice: "Sorry Charlie!"
    end
  end

  def create
    @comment = @item.comments.build(comment_params)
    if @comment.save
      redirect_to @item
    else
      render :new
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to @item
    else
      redirect_to @item, notice: "Sorry Charlie!"
  end
end


private

  def find_item
    @item = Item.find(params[:item_id])
  end


  def comment_params
    params.require(:comment).permit( :name, :body, :user_id, :item_id)
  end


end
