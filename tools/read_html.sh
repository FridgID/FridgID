#!/bin/bash

echo "delete failed.txt"
rm failed.txt

echo "parsing html/*.html to json"
echo "delete old parsed file..."
echo "[" > json/scrape_recipes.json

for file in html/*.html; do
  echo "[sh] parsing $file...";
  ruby parse_recipe.rb $file
done

# delete last comma
sed -iSED '$ s/.$//' json/scrape_recipes.json
echo "]" >> json/scrape_recipes.json
