class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def shortened_title
    title.truncate(32)
  end

  def ingredients_match(selected_ingrs)
    ingredients.map(&:name) & selected_ingrs
    # com = ingredients.map(&:name) & selected_ingrs
    # puts "-----------------"
    # puts "ingrs: #{ingredients.map(&:name)}"
    # puts "selected: #{selected_ingrs}"
    # puts "common: #{com}"
  end

  def seasonal_score
    score = 0
    ingredients.each do |ingr|
      score += ingr.seasonal
    end
    (ingredients.count * 2 / score) * 10
  end
end
