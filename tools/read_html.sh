#!/bin/bash
echo "delete failed.txt"
rm -f failed.txt

img_flag=false
if [ "$1" == "dl=img" ]; then
  img_flag=true
fi

if $img_flag; then
  echo "image flag ON!"
else
  echo "image flag OFF!"
fi

echo "parsing html/*.html to json"
echo "delete old parsed file..."
echo "[" > json/scrape_recipes.json

for file in html/*.html; do
  echo "[sh] parsing $file...";
  if $img_flag; then
    ruby parse_recipe.rb $file dl=img
  else
    ruby parse_recipe.rb $file
  fi
done

# delete last comma
sed -iSED '$ s/.$//' json/scrape_recipes.json
echo "]" >> json/scrape_recipes.json

if $img_flag; then
  echo "copy images to assets [y/N]"
  read -p "" yn
  echo ""
  if [ "$yn" == "y" ]; then
    echo "copying images..."
  elif [ "$yn" == "Y" ]; then
    echo "copying images..."
  else
    echo "skip images"
    echo "done."
    exit
  fi

  cp img/* ../app/assets/images/recipes/
fi

echo "done."
