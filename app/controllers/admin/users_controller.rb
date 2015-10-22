class Admin::UsersController < ApplicationController
  before_filter :authorize

  def index
    @users = User.page(params[:page]).per(11)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    redirect_to edit_admin_user_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if @user.destroy
      redirect_to admin_users_path

      # Tell the UserMailer to send a welcome email after save
    #   UserMailer.delete_email(@user).deliver_now
 
    #   format.html { redirect_to(@user, notice: 'User was successfully deleted.') }
    # else

    #   format.html { render action: 'new' }
    #   redirect_to movies_path
    end

  end

def create
    @user = User.new user_params
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :is_admin)
  end

end
