class RemoveBioFromUser < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :bio
  end

  def down
    add_column :users, :email
  end
end
