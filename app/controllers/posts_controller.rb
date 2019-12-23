class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :pet_id, :photo, :video)
  end
end

