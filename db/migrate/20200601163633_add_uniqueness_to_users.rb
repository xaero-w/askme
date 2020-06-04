class AddUniquenessToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uniqueness, :string
  end
end
