class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:landing]

  def index
    @posts = Post.timeline(current_user).order('created_at DESC').paginate(page: params[:page], per_page: 10)
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

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_path
  end

  def like
    @post = Post.find(params[:id])
    if already_liked?
      flash[:notice] = "Already Liked!"
      redirect_to post_path(@post)
    else
      Like.create!(likeable: @post, user: current_user, like: params[:like])
      respond_to do |format|
        format.html do
          flash[:success] = "Like Counted!"
          redirect_to post_path(@post)
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :pet_id, :photo, :video)
  end

  def already_liked?
    Like.where(likeable: @post, user: current_user, like: params[:like]).exists?
  end

end