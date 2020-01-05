class CreateFavors < ActiveRecord::Migration[5.2]
  def change
    create_table :favors do |t|
      t.references :pet, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
