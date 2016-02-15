class User < ActiveRecord::Base
  before_create :generate_token

  has_secure_password

  belongs_to :active_band, foreign_key: :band_id, class_name: 'Band'

  has_many :bands_users
  has_many :bands, through: :bands_users

  validates :password,
    length: { in: 8..32},
    allow_nil: true
  validates :email,
    uniqueness: true

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end
end
