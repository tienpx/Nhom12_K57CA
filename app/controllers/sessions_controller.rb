class SessionsController < ApplicationController
	def new
		
	end

	def create
    @user = User.where(:name => params[:signin][:name]).first
    if @user && @user.authenticate(params[:signin][:password])
      session[:@user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Your account haven't been registered yet. Please Singing up first!"
      render :new
    end
  end

end
