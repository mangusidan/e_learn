class AddAvatarToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_table :users, :avatar, :string
  end
end
