# rubocop: disable all

def singular(word)
  if word[-1] == 'a'
    return word
  else
    return word.singularize
  end
end

###############
# ingredients #
###############
def json_ingredients
  data = JSON.parse(File.read(Rails.root.to_s + '/tools/json/ingredients.json'))
  data.each do |ing|
    puts "creating #{ing['name']} -> #{singular(ing['name'])}"
    Ingredient.create!(name: singular(ing['name']), from_month: ing['from_month'], to_month: ing['to_month'])
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
  data = JSON.parse(File.read(Rails.root.to_s + '/tools/json/scrape_recipes.json'))
  data.each do |r|
    puts "Recipe '#{r['title']}'"
    print "ingredients ["
    r_db = json_to_recipe(r)
    r['metrics'].each do |m|
      # puts "+ #{m[0]}"
      i_db = Ingredient.find_by(name: m[0])
      RecipeIngredient.create!(recipe_id: r_db.id, ingredient_id: i_db.id)
      # join = RecipeIngredient.new(recipe_id: r_db.id, ingredient_id: i_db.id)
      # if join.save
      #   print "."
      # else
      #   print "!"
      # end
    end
    puts "]"
    puts "ingredients: #{r_db.ingredients.count}"
  end
end
