class ApplicationController < ActionController::Base
  # Override the default after sign in path
  def after_sign_in_path_for(resource)
    # Redirect the user to a specific page after login, such as dashboard_path
    pallets_path # You can replace this with any route you prefer
  end
end
