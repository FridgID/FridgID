class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients


  def shortened_title
    title.truncate(32)
  end
end
