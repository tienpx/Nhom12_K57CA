class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:signin][:email]).first
    if @user && @user.authenticate(params[:signin][:password])
      sign_in(@user)
      session[:@user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
