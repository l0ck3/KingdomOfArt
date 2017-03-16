class RegistrationsController < Devise::RegistrationsController
  layout "lvl4_layout", only: [ :after_sign_up_path_for ]

  protected

  def after_sign_up_path_for(resource)
    '/profiles/new' # Or :prefix_to_your_route
  end
end
