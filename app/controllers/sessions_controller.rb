class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      if params[:remember_me]
        permanent_sign_in(@user)
      else
        sign_in(@user)
      end
      flash[:success] = "Signed in!"
      redirect_to root_url
    else
      flash.now[:error] = "Incorrect username or password."
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: 'Signed out successfully!'
  end
end
