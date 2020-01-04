class SessionsController < Devise::SessionsController
  # https://github.com/plataformatec/devise/tree/master/app/controllers/devise
  
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: posts_path
  end
end
