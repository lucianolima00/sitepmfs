class RemoveAvatarsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :avatars, :string
    remove_column :users, :avatar, :json
  end
end
