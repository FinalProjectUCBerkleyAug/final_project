class PostsController < ApplicationController
  def index
    
  end

  def show
    @post = Post.find(params[:id])
    @photo = Photo.new
  end
end
