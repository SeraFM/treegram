class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    flash[:notice] = "Successfuly added comment"
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :photo_id, :content)
  end

end
