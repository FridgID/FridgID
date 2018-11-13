class YummlyScraper
  require 'open-uri'
  require 'json'
  require 'httparty'
  include HTTParty

  BASE_URL = "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['YUMMLY_API_ID']}&_app_key=#{ENV['YUMMLY_API_KEY']}"
  RECIPE_URL = "http://api.yummly.com/v1/api/recipe/"

  def self.search_for_recipe(ingredient, max_results = 10)
    request = HTTParty.get(BASE_URL + "&q=#{ingredient}" + "&maxResult=#{max_results}")
    request["matches"].map do |recipe|
      recipe["recipeName"]
    end
  end


  def self.display_recipe(recipe_id)
    request = HTTParty.get(RECIPE_URL + "#{recipe_id}?_app_id=#{ENV['YUMMLY_API_ID']}&_app_key=#{ENV['YUMMLY_API_KEY']}")
    request["images"].map do |recipe|
      recipe["hostedLargeUrl"]
    end
  end
end
