class CreatePlaids < ActiveRecord::Migration[5.2]
  def change
    create_table :plaids do |t|
      t.string :public_token

      t.timestamps
    end
  end
end
