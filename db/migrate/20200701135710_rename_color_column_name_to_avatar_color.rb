class RenameColorColumnNameToAvatarColor < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :color, :avatar_color
  end
end
