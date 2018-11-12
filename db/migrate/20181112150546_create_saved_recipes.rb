class CreateSavedRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_recipes do |t|
      t.references :user, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
