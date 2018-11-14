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
slt = Ingredient.create!(name: 'salt', from_month: '', to_month: '') # season less!

puts "create pumkin risotto..."
pr = Recipe.create(title: 'pumpkin risotto', description: 'its nice', method: 'put in pumkin and make some food', photo: 'https://food-images.files.bbci.co.uk/food/recipes/pumpkinrisottowithcr_13723_16x9.jpg')

puts "add pumpik risotto ingredients..."
RecipeIngredient.create!(recipe_id: pr.id, ingredient_id: pkn.id)
RecipeIngredient.create!(recipe_id: pr.id, ingredient_id: slt.id)

puts "pumpink risotto has #{pr.ingredients.count} ingredients!"
