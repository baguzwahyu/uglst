class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if current_user
      user_path(current_user)
    else
      root_path
    end
  end
end
