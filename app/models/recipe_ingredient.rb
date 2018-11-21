class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  # support duplicated ingredients in recipes
  # validates_uniqueness_of :recipe_id, scope: :ingredient_id
end
