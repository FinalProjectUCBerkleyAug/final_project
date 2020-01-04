class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: posts_path
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end

    @new_pet = Pet.create(name: 'other', user_id: resource.id, breed: 'other', species: 'other')
    # current_user didn't work here, so used resource to access the current_user info.
    resource.pet_id << @new_pet.id
    resource.save
  end

end
