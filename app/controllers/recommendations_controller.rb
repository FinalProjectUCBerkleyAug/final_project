class RecommendationsController < ApplicationController
  def index
    @posts=Post.order("RANDOM()").limit(10)
  end
end
