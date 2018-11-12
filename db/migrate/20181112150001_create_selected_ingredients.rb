class CreateSelectedIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :selected_ingredients do |t|
      t.references :user, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
