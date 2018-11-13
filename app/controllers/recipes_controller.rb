class RecipesController < ApplicationController
  require 'open-uri'
  # Using seeds and sample imgs before adding yummly api.
  def index
    @recipes = Recipe.all
  end

  def show
  end

  def search
    ingredient = 'pumpkin'
    base_url = 'http://api.yummly.com/v1/api/recipes?_app_id=#{ENV[YUMMLY_API_ID]}&_app_key=#{ENV[YUMMLY_API_KEY]}&#{ingredient}'
    response = RestClient.get"base-url"
    # define base url - http://api.yummly.com/v1/api/recipes?_app_id=app-id&_app_key=app-key&your _search_parameters
  end
end
