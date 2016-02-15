class BandInvite < ActiveRecord::Base
  before_create :generate_token

  belongs_to :band
  belongs_to :user

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.band_id, Time.now, rand].join)
  end
end
