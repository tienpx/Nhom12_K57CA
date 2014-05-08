class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have signed up successfully"
      sign_in(@user)
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params = user_params.dup
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    else
      params[:password_confirmation] = params[:password]
    end

    if @user.update(params)
      flash[:success] = "Your profile has been updated."
      redirect_to @user
    else
      flash[:error] = "Your profile has not been updated."
      render :action => "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end

end
