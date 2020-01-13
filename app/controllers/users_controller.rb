class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    petId = current_user.pet_id
    @pets = Pet.find(params[petId])
  end

end
