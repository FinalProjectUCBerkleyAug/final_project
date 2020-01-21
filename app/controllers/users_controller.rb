class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @pets = Pet.includes(:posts).where(user_id: @user)
    @favors = @user.favors.count
  end

end
