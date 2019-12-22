class PostsController < ApplicationController
  def index
    @posts = Post.all
  end


  private

  def post_params
    params.require(:post).permit(:content, :user_id, :pet_id, :photo, :video)
  end
end

