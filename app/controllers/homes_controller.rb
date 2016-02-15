class HomesController < ApplicationController
  before_action :require_login

  def index
    if current_user.bands.count == 0
      redirect_to new_band_path
    else
      redirect_to current_user.active_band
    end
  end
end
