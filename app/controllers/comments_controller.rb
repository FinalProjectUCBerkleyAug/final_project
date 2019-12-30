class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @posts = Post.find(params[:post_id])
    @posts.comments.create(comment_params.merge(user: current_user))
    redirect_to post_path(@posts)
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
