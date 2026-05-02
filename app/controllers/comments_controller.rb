class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      # 🚨 create notification for item owner (if not self-comment)
      if @item.user != current_user
        Notification.create!(
          user: @item.user,
          sender: current_user,
          item: @item,
          notification_type: :comment,
          is_read: false
        )
      end

      redirect_to item_path(@item), notice: "Comment added"
    else
      redirect_to item_path(@item), alert: "Failed to add comment"
    end
  end

  def edit
    @item = @comment.item
    redirect_to item_path(@item), alert: "Not allowed" unless @comment.user == current_user

  end

  def update
    @item = @comment.item

    if @comment.user == current_user && @comment.update(comment_params)
      redirect_to item_path(@item), notice: "Comment updated"
    else
      redirect_to item_path(@item), alert: "Not allowed or failed"
    end
  end

  def destroy
    @item = @comment.item

    if @comment.user == current_user
      @comment.destroy
    end

    redirect_to item_path(@item)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end