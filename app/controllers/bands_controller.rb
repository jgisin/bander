class BandsController < ApplicationController
  before_action :set_band, only: [:show, :update]
  before_action :require_login

  def new
    @band = Band.new
  end

  def create
    @band = current_user.bands.build(band_params)
    if current_user.save
      current_user.update(active_band: @band)
      redirect_to root_url, notice: 'Band created successfully!'
    else
      render :new, alert: 'Could not create band.'
    end
  end

  def show
    @song = Song.new
  end

  def update
    if @band.update(band_params)
      redirect_to @band
    else
      redirect_to :back
    end
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
