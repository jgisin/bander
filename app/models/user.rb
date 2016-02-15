class User < ActiveRecord::Base
  before_create :generate_token
  after_validation :set_active_band

  has_secure_password

  belongs_to :active_band, foreign_key: :band_id, class_name: 'Band'

  has_many :bands_users
  has_many :bands, through: :bands_users

  validates :password,
    length: { in: 8..32},
    allow_nil: true
  validates :email,
    uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def set_active_band
    if !self.active_band && self.bands.count > 0
      self.active_band = self.bands.last
    end
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end
end
