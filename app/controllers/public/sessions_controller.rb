# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # ------------------------------------------------------------------------------------------------------------------
  # ログイン後遷移先
  def after_sign_in_path_for(resource)
    my_page_users_path
  end
  # ------------------------------------------------------------------------------------------------------------------
  # ログイン後遷移先
  def after_sign_out_path_for(resource)
    homes_about_path
  end
  # ------------------------------------------------------------------------------------------------------------------
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
