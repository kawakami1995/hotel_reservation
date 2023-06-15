class UsersController < ApplicationController
  before_action :authenticate_user!  

  def account
    @user = current_user
  end

  def account_edit
    @user = current_user
  end

  def account_update
    @user = current_user
    if @user.update(params.require(:user).permit(:email,:password))
      redirect_to "/users/account"
    else
      render "edit"
    end
  end
    
  def profile
    @user = current_user
  end

  def profile_edit
    @user = current_user
  end

  def profile_update
    @user = current_user
    if @user.update(params.require(:user).permit(:user_name, :self_introduction, :user_image))
      redirect_to "/users/profile"
    else
      render "edit"      
    end
  end

  def destroy 
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/"
  end

end
