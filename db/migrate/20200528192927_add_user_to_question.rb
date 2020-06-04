class AddUserToQuestion < ActiveRecord::Migration[6.0]
  def change
    # add_reference :questions, :user, null: false, foreign_key: true
    add_reference :questions, :user, index: true, foreign_keys: true
  end
end
