class BandInvitesController < ApplicationController

  def create
    @invite = BandInvite.new(band_invite_params)
    @invite.user = current_user
    if @invite.save
      UserMailer.band_invite_email(params[:email], @invite).deliver
      redirect_to :back
    end
  end

  private

  def band_invite_params
    params.require(:band_invite).permit(:band_id)
  end

end
