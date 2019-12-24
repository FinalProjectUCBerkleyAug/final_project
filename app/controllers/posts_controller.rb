class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def landing
  end
end

