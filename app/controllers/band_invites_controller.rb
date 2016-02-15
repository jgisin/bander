class BandInvitesController < ApplicationController
  def create
    @invite = BandInvite.new(band_invite_params)
    @invite.user = current_user
    if @invite.save
      UserMailer.band_invite_email(params[:email], @invite).deliver
      redirect_to :back
    end
  end

  def activate
    @invite = BandInvite.find_by_token(params[:invite_token])
    if current_user
      current_user.update(bands: current_user.bands + [@invite.band])
      redirect_to root_url
    else
      redirect_to new_user_url(invite_token: params[:invite_token])
    end
  end

  private

  def band_invite_params
    params.require(:band_invite).permit(:band_id)
  end

end
