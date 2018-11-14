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
stw = Ingredient.create!(name: 'strawberry', from_month: 'may', to_month: 'september')
Ingredient.create!(name: 'beetroot', from_month: 'january', to_month: 'december')
slt = Ingredient.create!(name: 'salt', from_month: '', to_month: '') # season less!
sgr = Ingredient.create!(name: 'sugar', from_month: '', to_month: '') # season less!


puts "create Curried Pumpkin Soup..."
pr = Recipe.create(title: 'Curried Pumpkin Soup', description: 'The flavor combinations in this creamy yet light soup are complex, but making it is very easy. Like the best appetizers, the soup wakes up the palate and is not too filling.', method: 'Cook onions in butter in a wide 6-quart heavy pot over moderately low heat, stirring occasionally, until softened, 3 to 5 minutes. Add garlic and ginger and cook, stirring, 1 minute. Add cumin, coriander, and cardamom and cook, stirring, 1 minute. Stir in salt, red pepper flakes, pumpkin, water, broth, and coconut milk and simmer, uncovered, stirring occasionally, 30 minutes. Purée soup in batches in a blender until smooth (use caution when blending hot liquids), transferring to a large bowl, and return soup to pot. Keep soup warm over low heat.
Heat oil in a small heavy skillet over moderately high heat until hot but not smoking, then cook mustard seeds until they begin to pop, about 15 seconds. Add curry leaves and cook 5 seconds, then pour mixture into pumpkin soup. Stir until combined well and season soup with salt. Soup can be thinned with additional water.
Cooks note: Soup can be made 1 day ahead and cooled completely, uncovered, then chilled, covered.', photo: 'https://assets.epicurious.com/photos/5b98197bebe87f3c0fe890c7/6:4/w_620%2Ch_413/Curried-Pumpkin-Soup-05092018.jpg')

puts "add Curried Pumpkin Soup  ingredients..."
RecipeIngredient.create!(recipe_id: pr.id, ingredient_id: pkn.id)
RecipeIngredient.create!(recipe_id: pr.id, ingredient_id: slt.id)

puts "Curried Pumpkin Soup has #{pr.ingredients.count} ingredients!"

puts "create Mini Strawberry Eton Mess..."
et = Recipe.create(title: 'Mini Strawberry Eton Mess', description: 'A classic British dessert made of whipped cream, store-bought meringues, and fruit, this recipe is as easy to make as it is impressive. The meringues will soften as they sit, giving just the right amount of texture.', method: 'Toss half of sliced berries with sugar in a medium heatproof bowl. Cover tightly with plastic wrap and set over a medium saucepan filled with 1" of barely simmering water. Let sit until berries are soft and juices have accumulated in bowl, 25–30 minutes. Let cool, then toss in remaining sliced berries.
Whisk cream in a medium bowl to soft peaks. Layer cream, meringues, then strawberry mixture in four 8-oz. glasses. Chill 20 minutes. Top with whole strawberries to serve.', photo: 'https://assets.epicurious.com/photos/5b16fb0ee11c7059ce5abbf3/6:4/w_620%2Ch_413/strawberry-eton-mess-BA-060518.jpg')

puts "add Mini Strawberry Eton Mess ingredients..."
RecipeIngredient.create!(recipe_id: et.id, ingredient_id: stw.id)
RecipeIngredient.create!(recipe_id: et.id, ingredient_id: sgr.id)

puts "Mini Strawberry Eton Mess has #{et.ingredients.count} ingredients!"
