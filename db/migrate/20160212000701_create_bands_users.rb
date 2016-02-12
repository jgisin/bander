class CreateBandsUsers < ActiveRecord::Migration
  def change
    create_table :bands_users do |t|
      t.references :band, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
