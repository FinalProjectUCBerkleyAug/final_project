class FavorsController < ApplicationController
  before_action :find_pet
  before_action :find_favor, only: [:destroy]

  def create
    if already_favored?
      flash[:notice] = "Already favored!"
    else
      @pet.favors.create(user_id: current_user.id)
      if current_user != @pet.user
        Notification.create(recipient: @pet.user, actor: current_user, action: "favored", notifiable: @pet)
      end
    end
    redirect_to pet_path(@pet)
  end

  def destroy
    if !(already_favored?)
      flash[:notice] = "You have not favored this pet. Cannot unfavor."
    else
      @favor.destroy
    end
    redirect_to pet_path(@pet)
  end

  private

  def already_favored?
    Favor.where(user_id: current_user.id, pet_id: params[:pet_id]).exists?
  end

  def find_pet
    @pet = Pet.find(params[:pet_id])
  end

  def find_favor
    @favor = @pet.favors.find(params[:id])
  end
end
