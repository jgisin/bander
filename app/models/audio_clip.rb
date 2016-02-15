class AudioClip < ActiveRecord::Base
  belongs_to :song
  mount_uploader :audio_file, AudioFileUploader
end
