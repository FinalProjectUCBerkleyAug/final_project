class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.text :name
      t.text :description
      t.string :species
      t.string :breed
      t.integer :user_id
      t.timestamps
    end

    add_index :pets, :user_id
  end
end
