class Song < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper
  after_validation :sanitize_lyrics
  default_scope { order('position') }
  has_many :audio_clips
  belongs_to :band

  def sanitize_lyrics
    if lyrics
      self.lyrics = strip_tags(lyrics.strip.chomp)
      unless self.lyrics =~ /\w/
        self.lyrics = nil
      end
    end
  end
end
