# Add this class to be able to update devise info without password
#   because this is using github omniauth for login
class RegistrationsController < Devise::RegistrationsController
   def new
    flash[:info] = 'Please Register Through Github'
    redirect_to user_omniauth_authorize_path(:github)
  end

  def create
    flash[:info] = 'Please Register Through Github'
    redirect_to user_omniauth_authorize_path(:github)
  end
  # Everything above is to disable user registration
  # Everything below is to allow Update without password.
  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      # remove the virtual current_password attribute
      # update_without_password doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  private

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      params[:user][:password].present? ||
      params[:user][:password_confirmation].present?
  end
end
