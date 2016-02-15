class CreateAudioClips < ActiveRecord::Migration
  def change
    create_table :audio_clips do |t|
      t.references :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
