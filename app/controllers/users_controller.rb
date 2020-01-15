class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @pets = Pet.includes(:posts).where(user_id: current_user)
  end

end
