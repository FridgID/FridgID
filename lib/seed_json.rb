# rubocop: disable all
###############
# ingredients #
###############
def json_ingredients
  data = JSON.parse(File.read(Rails.root.to_s + '/lib/json/ingredients.json'))
  data.each do |ing|
    puts "creating #{ing['name']} -> #{ing['name'].singularize}"
    Ingredient.create!(name: ing['name'].singularize, from_month: ing['from_month'], to_month: ing['to_month'])
  end
end

###########
# recipes #
###########
# helper
def json_to_recipe(r)
  Recipe.create!(
    title: r['title'],
    description: r['description'],
    method: r['method'],
    metrics: r['metrics'],
    photo: r['photo']
  )
end

# main
def json_recipes
  data = JSON.parse(File.read(Rails.root.to_s + '/lib/json/recipes.json'))
  data.each do |r|
    puts "Recipe '#{r['title']}'"
    r_db = json_to_recipe(r)
    r['ingredients'].each do |i|
      # puts "+ #{i}"
      i_db = Ingredient.find_by(name: i)
      RecipeIngredient.create!(recipe_id: r_db.id, ingredient_id: i_db.id)
    end
    puts "ingredients: #{r_db.ingredients.count}"
  end
end
