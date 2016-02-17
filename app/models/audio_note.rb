class AudioNote < ActiveRecord::Base
  belongs_to :audio_clip

  def format_time
    string = self.time.to_s
    seconds, second = string.split(".")
    minutes = 0
    seconds = seconds.to_i
    while seconds >= 60
      seconds -= 60
      minutes += 1
    end
    minutes.to_s.rjust(1,'0') + ":" + seconds.to_s.rjust(2,'0')
  end
end
