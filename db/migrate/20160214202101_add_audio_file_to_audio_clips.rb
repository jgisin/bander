class AddAudioFileToAudioClips < ActiveRecord::Migration
  def change
    add_column :audio_clips, :audio_file, :string
  end
end
