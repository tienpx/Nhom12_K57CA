class UsersController < ApplicationController
 def index
 end 

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      #<center>flash[:notice] = "You have signed up successfully."</center>
      #redirect_to root_path
    else
      flash[:notice] = "Please fill in all the boxes"
      render :new
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
