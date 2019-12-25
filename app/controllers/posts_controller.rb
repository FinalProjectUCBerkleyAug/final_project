class PostsController < ApplicationController
  def index
    @posts = Post.timeline(current_user).order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end


  private

  def post_params
    params.require(:post).permit(:content, :user_id, :pet_id, :photo, :video)
  end
end

