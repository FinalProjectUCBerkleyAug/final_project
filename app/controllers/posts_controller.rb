class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:landing]

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
    @pet = Pet.find(params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :pet_id, :photo, :video)
  end

end