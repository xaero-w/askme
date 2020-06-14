class AddEmailIndexToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email_index, :string
  end
end
