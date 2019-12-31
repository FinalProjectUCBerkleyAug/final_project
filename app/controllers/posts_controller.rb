class PostsController < ApplicationController
  def index
    @posts = Post.timeline(current_user).order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_path
  end

  def landing

  end

  def new
    @posts = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @username = @post.user.username
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :pet_id, :photo, :video)
  end
end
