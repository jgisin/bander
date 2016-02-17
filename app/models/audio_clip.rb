class AudioClip < ActiveRecord::Base
  belongs_to :song
  has_many :audio_notes
  mount_uploader :audio_file, AudioFileUploader
end
