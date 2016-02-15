class Song < ActiveRecord::Base
  default_scope { order('position') }
  has_many :audio_clips
  belongs_to :band
end
