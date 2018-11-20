class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  serialize :metrics, JSON

  def shortened_title
    title.truncate(32)
  end

  # returns number of given ingredients that match with this recipe
  def ingredients_match(selected_ingrs)
    (ingredients.map(&:name) & selected_ingrs).count
    # com = ingredients.map(&:name) & selected_ingrs
    # puts "-----------------"
    # puts "ingrs: #{ingredients.map(&:name)}"
    # puts "selected: #{selected_ingrs}"
    # puts "common: #{com}"
  end

  # returns seasonal score in percent
  def seasonal_score
    score = 0
    ingredients.each do |ingr|
      score += ingr.seasonal
    end
    max = ingredients.count * 2
    (score * 100 / max)
    # puts "--------------"
    # puts "recipe: #{title}"
    # puts "score #{score} / #{max}"
  end
end
