class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:firstname, :lastname, :email, :phone,
                                             { locations_attributes: %i[id customer_id address postalcode city region_id] }])
  end
end
