class AddPetToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pet_id, :string
  end
end
