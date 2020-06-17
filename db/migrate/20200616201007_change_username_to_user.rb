class ChangeUsernameToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |u|
      u.index :username, unique: true
    end
  end
end
