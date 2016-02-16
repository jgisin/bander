class Song < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper
  after_validation :sanitize_lyrics
  default_scope { order('position') }
  has_many :audio_clips
  belongs_to :band

  validates :name, :band, presence: true
  validates :name, length: { maximum: 30 }

  def sanitize_lyrics
    if lyrics
      unless strip_tags(lyrics.strip.chomp) =~ /\w/
        self.lyrics = nil
      end
    end
  end
end
