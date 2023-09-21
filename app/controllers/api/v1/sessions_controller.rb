# # This is for handling user sessions within an API. This controller responds to JSON requests
# # and handles actions related to user sign-in and sign-out.

class Api::V1::SessionsController < ApplicationController
  # include Devise::Controllers::SignInOut
  respond_to :json
  # This specifies that this controller should respond to JSON requests. This means that
  # when a client makes a request to this controller's actions, the response will be in
  # JSON format, which is typical for API endpoints.

  def destroy
    # Sign out the user
    sign_out(current_user) if user_signed_in?

    render json: { message: 'User signed out successfully' }
  end

  def create
    username = params[:user][:username] # It extracts the username from the request parameters.
    user = User.find_by(username:) # find a user by the provided username.

    if user&.valid_password?(params[:user][:password])
      sign_in(user)
      render json: { user:, message: 'Sign in successfuly' }
    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
    end

    # If the user's username and password are valid, it signs in the user using
    # sign_in(user) (provided by Devise).

    # It responds with a JSON object that includes the signed-in user's information
    # (user) and a success message.

    # If the username or password is invalid, it responds with an error message and a
    # status code of :unprocessable_entity. This helps the client understand what went
    # wrong during the sign-in process.
  end
end
