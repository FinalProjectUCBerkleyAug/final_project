class PostsController < ApplicationController
  def index
    @posts = Post.timeline(current_user).order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def landing
    # Pull most recent 15 posts from db
    last_ten = Post.last(15);
    #randomly choose 3 posts to display
    @random_posts = last_ten.sample(3);
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
