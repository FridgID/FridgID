puts "destroy users..."
User.destroy_all
puts "destroy recipes..."
RecipeIngredient.destroy_all
Recipe.destroy_all
puts "destroy ingredients..."
Ingredient.destroy_all

puts "create test user..."
User.create!(email: 'test@test.com', password: 'password')

puts "create ingredients..."
pkn = Ingredient.create!(name: 'pumpkin', from_month: 'august', to_month: 'december')
Ingredient.create!(name: 'apple', from_month: 'october', to_month: 'february')
Ingredient.create!(name: 'strawberry', from_month: 'may', to_month: 'september')
Ingredient.create!(name: 'beetroot', from_month: 'january', to_month: 'december')
ban = Ingredient.create!(name: 'banana', from_month: '', to_month: '')
glc = Ingredient.create!(name: 'garlic', from_month: 'june', to_month: 'october')
sgr = Ingredient.create!(name: 'sugar', from_month: '', to_month: '')
bef = Ingredient.create!(name: 'beef', from_month: '', to_month: '')
brc = Ingredient.create!(name: 'broccoli', from_month: 'july', to_month: 'october')
slt = Ingredient.create!(name: 'salt', from_month: '', to_month: '') # season less!

puts "create pumkin risotto..."
pr = Recipe.create(title: 'pumpkin risotto', description: 'its nice', method: 'put in pumkin and make some food', photo: 'https://food-images.files.bbci.co.uk/food/recipes/pumpkinrisottowithcr_13723_16x9.jpg')

puts "add pumpkin risotto ingredients..."
RecipeIngredient.create!(recipe_id: pr.id, ingredient_id: pkn.id)
RecipeIngredient.create!(recipe_id: pr.id, ingredient_id: slt.id)

puts "create broccoli beef soup..."
br_soup = Recipe.create(title: 'broccoli beef soup', description: 'its nice', method: 'vegan soup with beef', photo: 'https://proxy.duckduckgo.com/iur/?f=1&image_host=http%3A%2F%2Fcleananddelicious.com%2Fwp-content%2Fuploads%2F2015%2F06%2FBroccoliStemSoup-CD.jpg&u=https://cleananddelicious.com/wp-content/uploads/2015/06/BroccoliStemSoup-CD.jpg')
RecipeIngredient.create!(recipe_id: br_soup.id, ingredient_id: bef.id)
RecipeIngredient.create!(recipe_id: br_soup.id, ingredient_id: brc.id)

puts "create best banana..."
bb = Recipe.create(title: 'best banana', description: 'its nice', method: 'Sweet banana with garlic THE BEST!', photo: 'https://media-cdn.tripadvisor.com/media/photo-s/0e/53/4f/32/we-turn-locally-grown.jpg')
RecipeIngredient.create!(recipe_id: bb.id, ingredient_id: ban.id)
RecipeIngredient.create!(recipe_id: bb.id, ingredient_id: glc.id)
RecipeIngredient.create!(recipe_id: bb.id, ingredient_id: sgr.id)



puts "----------------------------"
puts "pumpink risotto has #{pr.ingredients.count} ingredients!"
