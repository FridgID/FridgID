puts "destroy users..."
User.destroy_all
puts "destroy recipes..."
RecipeIngredient.destroy_all
Recipe.destroy_all
puts "destroy ingredients..."
Ingredient.destroy_all

puts "create test user..."
User.create!(email: 'test@test.com', password: 'password')

require_relative '../lib/seed_json.rb'
puts "loading json seeds..."
json_ingredients
json_recipes
exit
# require_relative '../lib/parse_raw.rb'
# puts "parsing raw..."
# parse_raw

puts "create ingredients..."
pkn = Ingredient.create!(name: 'pumpkin', from_month: 'August', to_month: 'December')
app = Ingredient.create!(name: 'apple', from_month: 'October', to_month: 'February')
stw = Ingredient.create!(name: 'strawberry', from_month: 'May', to_month: 'September')
btr = Ingredient.create!(name: 'beetroot', from_month: 'January', to_month: 'December')
ban = Ingredient.create!(name: 'banana', from_month: '', to_month: '')
glc = Ingredient.create!(name: 'garlic', from_month: 'June', to_month: 'October')
bef = Ingredient.create!(name: 'beef', from_month: '', to_month: '')
brc = Ingredient.create!(name: 'broccoli', from_month: 'July', to_month: 'October')
slt = Ingredient.create!(name: 'salt', from_month: '', to_month: '') # season less!
sgr = Ingredient.create!(name: 'sugar', from_month: '', to_month: '') # season less!
oni = Ingredient.create!(name: 'onion', from_month: 'January', to_month: 'December')
btr = Ingredient.create!(name: 'butter', from_month: '', to_month: '') # season less!
crm = Ingredient.create!(name: 'cream', from_month: '', to_month: '') # season less!
rce = Ingredient.create!(name: 'rice', from_month: '', to_month: '') # season less!
cul = Ingredient.create!(name: 'cauliflower', from_month: 'August', to_month: 'December')
pst = Ingredient.create!(name: 'pasta', from_month: '', to_month: '') # season less!
che = Ingredient.create!(name: 'cheese', from_month: '', to_month: '') # season less!
crt = Ingredient.create!(name: 'carrot', from_month: 'August', to_month: 'December')
egg = Ingredient.create!(name: 'egg', from_month: '', to_month: '') # season less!
lmn = Ingredient.create!(name: 'lemon', from_month: 'December', to_month: 'March')
brd = Ingredient.create!(name: 'bread', from_month: '', to_month: '') # season less!
kle = Ingredient.create!(name: 'kale', from_month: 'October', to_month: 'February')
bns = Ingredient.create!(name: 'beans', from_month: '', to_month: '') # season less!





# Roasted Beet Tzatziki Salad

puts "create Roasted Beet Tzatziki Salad..."
tza = Recipe.create(
  title: 'Roasted Beet Tzatziki Salad',
  description: 'This psychedelic Mediterranean-inspired salad marries bright, fresh ingredients with sweet, earthy roasted beets and perfectly cooked eggs. It tastes as good as it looks on the plate, and all the ingredients make for good snacks.',
  method: 'Spread the tzatziki on two serving plates and top with the eggs.
In a medium bowl, combine the tomato, cucumber, chile flakes, radishes, poppy seeds, fresh herbs, and buttermilk. Season with a little sea salt.
Broil or sauté the pickled beets to slightly caramelize and blister the outer surface.
Top the eggs with the cucumber-tomato salad and the hot beets. Garnish with more herbs, a pinch of sumac, a little olive oil, and the pickling liquid from the beets.',
  photo: 'https://assets.epicurious.com/photos/58dd7f3639487313e3d24afc/6:4/w_620%2Ch_413/roasted-beet-tzatziki-salad-HC-033017.jpg')
RecipeIngredient.create!(recipe_id: tza.id, ingredient_id: btr.id)
RecipeIngredient.create!(recipe_id: tza.id, ingredient_id: oni.id)
RecipeIngredient.create!(recipe_id: tza.id, ingredient_id: egg.id)
RecipeIngredient.create!(recipe_id: tza.id, ingredient_id: glc.id)





# Smoky Beans and Greens on Toast
puts "Smoky Beans and Greens on Toast..."
tst = Recipe.create(
  title: 'Smoky Beans and Greens on Toast',
  description: 'Beans and greens are great on almost every carb: in tortillas as tacos, over rice, on flatbread. But whenever skillet-fried toast is an option, you should probably take it.',
  method: 'Heat a large, heavy (preferably cast-iron) skillet over medium. Brush the bread on both sides with the olive oil. Lay the bread in the skillet and cook, pressing occasionally with a spatula, until crisp and golden brown, about 90 seconds per side. (If your slices are large, you may have to do this in two batches.) Set the bread aside.
Heat a Dutch oven or other heavy pot over medium-high heat. Add the bacon and cook, stirring frequently, until it has browned a little and rendered at least a tablespoon of fat, about 4 minutes. Add the onion and cook, stirring, until it has softened and turned golden, about 4 minutes. Add the garlic, paprika, thyme (if using), red pepper flakes, and, if you’re using canned beans, 1 teaspoon kosher salt and cook, stirring, for a minute or two..',
  photo: 'https://assets.epicurious.com/photos/5bdb55b95f1f4f592601e8e5/6:4/w_620%2Ch_413/smoky-beans-and-greens-on-toast-18042018-4018.jpg')
RecipeIngredient.create!(recipe_id: tst.id, ingredient_id: brd.id)
RecipeIngredient.create!(recipe_id: tst.id, ingredient_id: oni.id)
RecipeIngredient.create!(recipe_id: tst.id, ingredient_id: kle.id)
RecipeIngredient.create!(recipe_id: tst.id, ingredient_id: bns.id)




# Freeform Chicken Meatballs with Carrots and Yogurt Sauce
puts "create Freeform Chicken Meatballs with Carrots and Yogurt Sauce..."
meatballs = Recipe.create(
  title: 'Freeform Chicken Meatballs with Carrots and Yogurt Sauce',
  description: 'Shaping meatballs is too fussy for a weeknight meal. Instead, simply scatter this garam masala–spiced mixture onto a sheet pan and roast it along with carrots until both are golden brown and crispy-edged. Serve with a tart yogurt sauce and a handful of greens for an easy dinner that deserves a permanent place in your weeknight rotation.',
  method: 'Arrange racks in upper and lower thirds of oven; preheat to 425°F. Toss carrots, red pepper flakes, 2 Tbsp. oil, and 1/2 tsp. kosher salt on a rimmed baking sheet. Roast on lower rack, tossing once halfway through, until carrots are nicely browned and fork-tender, 20–25 minutes.
Meanwhile, mix ground chicken, scallions, egg, breadcrumbs, lemon zest, garam masala, 2 Tbsp. oil, and 1 1/2 tsp. kosher salt in a large bowl until just combined.
Rub another rimmed baking sheet with 1 Tbsp. oil. Using your hands, scatter chicken mixture in small mounds (about 2") on baking sheet. Roast on upper rack, turning pieces once halfway through with a spatula, until browned, crispy-edged, and cooked through, 15–20 minutes.
Meanwhile, whisk yogurt, 2 Tbsp. lemon juice, and remaining 1/4 tsp. kosher salt in a small bowl. Spoon sauce over a platter or divide among plates, swooshing with the back of a spoon.
Transfer carrots to baking sheet with meatballs and toss to combine. Arrange over yogurt sauce, then top with arugula. Drizzle with oil and lemon juice; season with sea salt.',
  photo: 'https://assets.epicurious.com/photos/5ad1106343f92a3268c0b8bc/6:4/w_620%2Ch_413/Freeform-Chicken-Meatballs-with-Carrots-and-Yogurt-Sauce-13032018.jpg')
RecipeIngredient.create!(recipe_id: meatballs.id, ingredient_id: crt.id)
RecipeIngredient.create!(recipe_id: meatballs.id, ingredient_id: oni.id)


# Onion Apple cake
puts "create Onion Apple cake..."
oac = Recipe.create(
  title: 'Onion Apple Cake',
  description: 'Bad recipe for good days',
  method: 'Take a cake. Then put an apple and an onion on it. BAM! done.',
  photo: 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Apple_pie.jpg')
RecipeIngredient.create!(recipe_id: oac.id, ingredient_id: app.id)
RecipeIngredient.create!(recipe_id: oac.id, ingredient_id: oni.id)

# Hidden Cauliflower Mac ‘n’ Cheese
puts "create Hidden Cauliflower Mac ‘n’ Cheese..."
mac = Recipe.create(title: 'Hidden Cauliflower Mac ‘n’ Cheese', description: 'I love finding ways to sneak vegetables into my family’s favorite comfort food, and this mac ‘n’ cheese fits the bill. When you cook the cauliflower, sauce, and pasta together at the same time in your Instant Pot, the cauliflower becomes so tender that it completely dissolves into the sauce when you give it a stir--no additional equipment needed. I’ve added extra seasonings here so you can use less cheese than traditional recipes call for, but be sure to use an extra-sharp Cheddar to maximize the cheesy flavor.', method: 'Pour the pasta into the Instant Pot and add the water, soy sauce, mustard, and salt. Stir well to combine, then add the cauliflower on top without stirring, making sure that the cauliflower layer completely covers the pasta for even cooking. Secure the lid and move the steam release valve to Sealing. Select Manual/ Pressure Cook to cook on high pressure for 3 minutes. While the pot is coming to pressure, shred the Cheddar (you should have about 1 cup, tightly packed).
When the cooking cycle is complete, let the pressure naturally release for 10 minutes, then move the steam release valve to Venting to release any remaining pressure.
When the floating valve drops, remove the lid and stir the pasta well, using a spatula to break up any pasta that has stuck together or stuck to the bottom of the pot. (A little sticking is to be expected, but it will loosen up when you stir.) Use the spatula to mash any intact cauliflower florets against the side of the pot to help them dissolve into the pasta sauce.
Add the Cheddar and parmesan and stir well. Taste and adjust the seasonings as needed and serve warm. Store leftovers in an airtight container in the fridge for 4 days.', photo: 'https://assets.epicurious.com/photos/5b3256e9bdb0044b20488c6e/6:4/w_620%2Ch_413/Lightened-Up-Mac-n-Cheese.jpg')
RecipeIngredient.create!(recipe_id: mac.id, ingredient_id: cul.id)
RecipeIngredient.create!(recipe_id: mac.id, ingredient_id: slt.id)
RecipeIngredient.create!(recipe_id: mac.id, ingredient_id: crm.id)
RecipeIngredient.create!(recipe_id: mac.id, ingredient_id: pst.id)
RecipeIngredient.create!(recipe_id: mac.id, ingredient_id: che.id)


# Curreied Pumkin Soup
puts "create Curried Pumpkin Soup..."
ps = Recipe.create(title: 'Curried Pumpkin Soup', description: 'The flavor combinations in this creamy yet light soup are complex, but making it is very easy. Like the best appetizers, the soup wakes up the palate and is not too filling.', method: 'Cook onions in butter in a wide 6-quart heavy pot over moderately low heat, stirring occasionally, until softened, 3 to 5 minutes. Add garlic and ginger and cook, stirring, 1 minute. Add cumin, coriander, and cardamom and cook, stirring, 1 minute. Stir in salt, red pepper flakes, pumpkin, water, broth, and coconut milk and simmer, uncovered, stirring occasionally, 30 minutes. Purée soup in batches in a blender until smooth (use caution when blending hot liquids), transferring to a large bowl, and return soup to pot. Keep soup warm over low heat.
Heat oil in a small heavy skillet over moderately high heat until hot but not smoking, then cook mustard seeds until they begin to pop, about 15 seconds. Add curry leaves and cook 5 seconds, then pour mixture into pumpkin soup. Stir until combined well and season soup with salt. Soup can be thinned with additional water.
Cooks note: Soup can be made 1 day ahead and cooled completely, uncovered, then chilled, covered.', photo: 'https://assets.epicurious.com/photos/5b98197bebe87f3c0fe890c7/6:4/w_620%2Ch_413/Curried-Pumpkin-Soup-05092018.jpg')
RecipeIngredient.create!(recipe_id: ps.id, ingredient_id: pkn.id)
RecipeIngredient.create!(recipe_id: ps.id, ingredient_id: slt.id)
RecipeIngredient.create!(recipe_id: ps.id, ingredient_id: oni.id)
RecipeIngredient.create!(recipe_id: ps.id, ingredient_id: glc.id)
RecipeIngredient.create!(recipe_id: ps.id, ingredient_id: btr.id)



# Mini Strawberry Eton Mess
puts "create Mini Strawberry Eton Mess..."
et = Recipe.create(title: 'Mini Strawberry Eton Mess', description: 'A classic British dessert made of whipped cream, store-bought meringues, and fruit, this recipe is as easy to make as it is impressive. The meringues will soften as they sit, giving just the right amount of texture.', method: 'Toss half of sliced berries with sugar in a medium heatproof bowl. Cover tightly with plastic wrap and set over a medium saucepan filled with 1" of barely simmering water. Let sit until berries are soft and juices have accumulated in bowl, 25–30 minutes. Let cool, then toss in remaining sliced berries.
Whisk cream in a medium bowl to soft peaks. Layer cream, meringues, then strawberry mixture in four 8-oz. glasses. Chill 20 minutes. Top with whole strawberries to serve.', photo: 'https://assets.epicurious.com/photos/5b16fb0ee11c7059ce5abbf3/6:4/w_620%2Ch_413/strawberry-eton-mess-BA-060518.jpg')
RecipeIngredient.create!(recipe_id: et.id, ingredient_id: stw.id)
RecipeIngredient.create!(recipe_id: et.id, ingredient_id: sgr.id)
RecipeIngredient.create!(recipe_id: et.id, ingredient_id: crm.id)


# Pumkin Risotto
puts "create Pumkin Risotto..."
pr = Recipe.create(title: 'Pumpkin Risotto', description: 'its nice', method: 'Put in pumkin and make some food', photo: 'https://food-images.files.bbci.co.uk/food/recipes/pumpkinrisottowithcr_13723_16x9.jpg')
RecipeIngredient.create!(recipe_id: pr.id, ingredient_id: pkn.id)
RecipeIngredient.create!(recipe_id: pr.id, ingredient_id: slt.id)
RecipeIngredient.create!(recipe_id: pr.id, ingredient_id: btr.id)
RecipeIngredient.create!(recipe_id: pr.id, ingredient_id: rce.id)



# Broccoli Beef Soup
puts "create Broccoli Beef Soup..."
br_soup = Recipe.create(title: 'Broccoli Beef soup', description: 'its nice', method: 'vegan soup with beef', photo: 'https://proxy.duckduckgo.com/iur/?f=1&image_host=http%3A%2F%2Fcleananddelicious.com%2Fwp-content%2Fuploads%2F2015%2F06%2FBroccoliStemSoup-CD.jpg&u=https://cleananddelicious.com/wp-content/uploads/2015/06/BroccoliStemSoup-CD.jpg')
RecipeIngredient.create!(recipe_id: br_soup.id, ingredient_id: bef.id)
RecipeIngredient.create!(recipe_id: br_soup.id, ingredient_id: brc.id)
RecipeIngredient.create!(recipe_id: br_soup.id, ingredient_id: crm.id)
RecipeIngredient.create!(recipe_id: br_soup.id, ingredient_id: glc.id)



# Best Banana
puts "create Best Banana..."
bb = Recipe.create(title: 'Best Banana', description: 'its nice', method: 'Sweet banana with garlic THE BEST!', photo: 'https://media-cdn.tripadvisor.com/media/photo-s/0e/53/4f/32/we-turn-locally-grown.jpg')
RecipeIngredient.create!(recipe_id: bb.id, ingredient_id: ban.id)
RecipeIngredient.create!(recipe_id: bb.id, ingredient_id: glc.id)
RecipeIngredient.create!(recipe_id: bb.id, ingredient_id: sgr.id)



puts "----------------------------"
puts "pumpink risotto has #{pr.ingredients.count} ingredients!"
