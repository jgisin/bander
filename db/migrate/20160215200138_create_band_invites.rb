class CreateBandInvites < ActiveRecord::Migration
  def change
    create_table :band_invites do |t|
      t.string :token
      t.references :band, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :band_invites, :token, unique: true
  end
end
