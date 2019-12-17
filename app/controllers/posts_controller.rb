class PostsController < ApplicationController

  def index

  end

  def list
    @posts = Post.timeline(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

