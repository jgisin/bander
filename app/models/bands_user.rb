class BandsUser < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :band_id }
  belongs_to :band
  belongs_to :user
end
