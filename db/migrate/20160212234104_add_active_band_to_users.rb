class AddActiveBandToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :band, index: true, foreign_key: true
  end
end
