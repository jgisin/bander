class CreateAudioNotes < ActiveRecord::Migration
  def change
    create_table :audio_notes do |t|
      t.decimal :time, precision: 6, scale: 3
      t.text :note
      t.references :audio_clip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
