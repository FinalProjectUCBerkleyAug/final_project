class RecommendationsController < ApplicationController
  def index
    posts = Post.last(50)
    @rec_posts = posts.sample(8)
  end
end
