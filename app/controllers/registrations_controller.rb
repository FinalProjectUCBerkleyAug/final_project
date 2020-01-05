class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    @new_pet = Pet.create(name: 'other', user_id: resource.id, breed: 'other', species: 'other')
    # current_user didn't work here, so used resource to access the current_user info.
    resource.pet_id << @new_pet.id
    resource.save
  end

  def update
    super
  end
end
