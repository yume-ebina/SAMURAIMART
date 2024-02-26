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
    
    def password_set?
      user_params[:password].present? && user_params[:password_confirmation].present? ?
      true : false
    end
    
    def user_params
      #{user: [:name, :email,:postal_code, :address, :phone]}
      params.require(:user).permit(:name, :email,:postal_code, :address, :phone, :password, :password_confirmation)
    end
    
    # def user_password_params
    #   #[:password, :password_confirmation]
    #   params.permit(:password, :password_confirmation)
    # end
end