class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user: current_user))

    #create the notifications
    if current_user != @post.user
      Notification.create(recipient: @post.user, actor: current_user, action: "posted", notifiable: @comment)
    end
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
