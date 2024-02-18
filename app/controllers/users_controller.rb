class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  def edit
  end

  def update
    @user.update_without_password(user_params)
    redirect_to mypage_users_url
  end
  
  def mypage
    @user = current_user
  end
  
  def edit_address
    
  end
  
  def favorite
    @favorites = @user.likees(Product)
  end
  
  private
    def set_user
      @user = current_user
    end
    
    def user_params
      params.require(:user).permit(:name, :email,:postal_code, :address, :phone, :password, :password_confirmation)
    end
end