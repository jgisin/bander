class BandsController < ApplicationController
  def new
    @band = Band.new
  end

  def create
    @band = current_user.bands.build(band_params)
    if current_user.save
      redirect_to root_url, notice: 'Band created successfully!'
    else
      render :new, alert: 'Could not create band.'
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
