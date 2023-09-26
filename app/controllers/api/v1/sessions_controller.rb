class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  def destroy
    # Sign out the user
    sign_out(current_user) if user_signed_in?

    render json: { message: 'User signed out successfully' }
  end

  def create
    self.resource = warden.authenticate(auth_options)
    if resource
      sign_in(resource)
      token = resource.authentication_token
      render json: { user: resource, token: }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  protected

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new", username: params[:username] }
  end

  private

  def sign_in_params
    params.require(:session).permit(:username, :password)
  end
end
