class PostsController < ApplicationController
  def index
    @posts = Post.find(params[:post_id])
  end

  def show
    @post = Post.find(params[:id])
    @photo = Photo.new
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

