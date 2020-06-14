class AddUserIndexToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_index, :string
  end
end
