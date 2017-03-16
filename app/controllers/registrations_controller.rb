class RegistrationsController < Devise::RegistrationsController
  layout "lvl4_layout", only: [ :after_sign_up_path_for ]

  protected

  def after_sign_up_path_for(resource)
    new_profiles_path # Or :prefix_to_your_route
  end
end
