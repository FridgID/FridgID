class AddColumnToRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_ingredients, :have_ingredient, :boolean
  end
end
