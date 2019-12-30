class CreatePets < ActiveRecord::Migration[5.2]
  def change
    connection.execute("DROP TABLE IF EXISTS pets")
    create_table :pets do |t|
      t.string :name
      t.integer :user_id
      t.string :breed
      t.string :species

      t.timestamps
    end
  end
end
