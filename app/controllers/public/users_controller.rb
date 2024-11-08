class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def my_page
    @user = current_user
  end

  def show
  end

  def index
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to my_page_users_path, notice: 'プロフィールを更新しました！'
    else
      render :edit
    end
  end

  def check
  end

  def destroy
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end