def json_ingredients
  data = JSON.parse(File.read(Rails.root.to_s + '/lib/json/ingredients.json'))
  data.each do |ing|
    puts "creating #{ing['name']} -> #{ing['name'].singularize}"
    Ingredient.create!(name: ing['name'].singularize, from_month: ing['from_month'], to_month: ing['to_month'])
  end
end
