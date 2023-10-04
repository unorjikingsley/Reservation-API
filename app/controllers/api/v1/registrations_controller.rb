# This controller is for user registrations within an API, and it inherits from Devise's
# RegistrationsController. This controller is specifically designed for user registration
# and responds to JSON requests.

class Api::V1::RegistrationsController < Devise::ApplicationController
  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.save
      sign_up(resource_name, resource)
      render json: resource
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password)
  end
end

# The create method handles the user registration process when a client sends a POST
# request to the registration endpoint. Here's what it does:

# build_resource(sign_up_params): This method builds a new user resource using the
# parameters passed in the request. sign_up_params is a private method that specifies
# which user attributes can be mass-assigned from the request parameters. In this case,
# it permits the :username, :email, and :password attributes.

# if resource.save: This checks if the user resource can be successfully saved to the
# database. If the user's information is valid and the record is saved, it proceeds
# to sign in the user (via sign_up(resource_name, resource)), which might not be needed
# in all API registration flows.

# render json: resource: If the user is successfully created, the user information is
# returned as a JSON response. This typically includes the user's attributes, like the
# username and email.

# else: If the user registration fails, it returns a JSON response with error messages.
# This helps the client understand what went wrong, such as validation errors like "Email
# can't be blank" or "Password is too short."

# private and sign_up_params: This section defines a private method called sign_up_params.
# This method specifies which parameters can be accepted from the client's request when
# creating a new user. In this case, it allows the :username, :email, and :password
# parameters. Using strong parameters in this way is important for security and helps
# protect against mass assignment vulnerabilities.

# In summary, this code is crucial for creating a user registration endpoint in your API.
# It handles the registration process, validation, error reporting, and JSON response
# formatting. Devise's RegistrationsController is a powerful tool for user management, and
# by customizing it as shown, you can integrate it seamlessly into your API while ensuring
# security and ease of use for your clients.
