class Band < ActiveRecord::Base
  has_many :songs
  has_many :bands_users
  has_many :users, through: :bands_users
end
