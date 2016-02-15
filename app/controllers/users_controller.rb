class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to root_url, notice: 'Account created!'
    else
      render :new, alert: 'Could not create account!'
    end
  end

  def set_active_band
    if band = Band.find(params[:band_id])
      current_user.update(active_band: band)
      redirect_to band
    else
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
