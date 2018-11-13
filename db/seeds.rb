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
pkn = Ingredient.create!(name: 'pumpkin', season: 'autumn')
Ingredient.create!(name: 'apple', season: 'autumn')
Ingredient.create!(name: 'strawberry', season: 'summer')
Ingredient.create!(name: 'beetroot', season: 'autumn')
slt = Ingredient.create!(name: 'salt', season: '') # season less!

puts "create pumkin risotto..."
pr = Recipe.create(title: 'pumpkin risotto', description: 'its nice', method: 'put in pumkin and make some food')

puts "add pumpik risotto ingredients..."
RecipeIngredient.create!(recipe_id: pr.id, ingredient_id: pkn.id)
RecipeIngredient.create!(recipe_id: pr.id, ingredient_id: slt.id)

puts "pumpink risotto has #{pr.ingredients.count} ingredients!"
