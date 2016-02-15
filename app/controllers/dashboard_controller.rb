class DashboardController < ApplicationController
  before_action :require_login

  def index
    redirect_to _
  end
end
