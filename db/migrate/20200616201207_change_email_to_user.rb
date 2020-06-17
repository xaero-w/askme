class ChangeEmailToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |u|
      u.index :email, unique: true
    end
  end
end
