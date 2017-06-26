class RegistrationsController < Devise::RegistrationsController
  layout "application"
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :specialty, :phone, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :specialty, :birth_date, :phone, :email, :password, :avatar, :password_confirmation, :current_password, :avatar_original_w, :avatar_original_h, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
  end
end