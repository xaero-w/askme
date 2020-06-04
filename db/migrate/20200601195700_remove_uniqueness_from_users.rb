class RemoveUniquenessFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :uniqueness, :string
  end
end
