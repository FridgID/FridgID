class RecipesController < ApplicationController
  require 'open-uri'
  # Using seeds and sample imgs before adding yummly api.
  def index
    # TODO: add pages or something like that
    # for now diplay max 20 recipes
    max_per_page = 20
    @dash_ingrs = params[:i]
    if params[:i].present?
      @selected_ingrs = params[:i].downcase.split('-')

      sql_query = "ingredients.name in (:query)"
      @recipes = Recipe.joins(:ingredients).where(sql_query, query: @selected_ingrs).distinct.limit(max_per_page)

      # same but selfmade with nice sqlinjection features
      # insecure_query = "SELECT DISTINCT recipes.* FROM recipes, ingredients, recipe_ingredients
      #   WHERE ingredients.id = recipe_ingredients.ingredient_id
      #   AND recipes.id = recipe_ingredients.recipe_id
      #   AND ingredients.name IN (#{@selected_ingrs.map { |i| "'" + i.to_s + "'" }.join(', ')})"
      # @recipes = Recipe.find_by_sql(insecure_query)

      if params[:order] == "match"
        @recipes = @recipes.sort do |a, b|
          ma = a.ingredients_match(@selected_ingrs)
          mb = b.ingredients_match(@selected_ingrs)
          puts "ma=#{ma} mb=#{mb}"
          mb <=> ma
        end
      end
    else
      @recipes = Recipe.all.limit(max_per_page)
      @selected_ingrs = nil
    end

    if params[:order] == "season"
      @recipes = @recipes.sort do |a, b|
        b.seasonal_score <=> a.seasonal_score
      end
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @stats = Ingredient.season_stats(@ingredients)
  end

  def search
    ingredient = 'pumpkin'
    base_url = 'http://api.yummly.com/v1/api/recipes?_app_id=#{ENV[YUMMLY_API_ID]}&_app_key=#{ENV[YUMMLY_API_KEY]}&#{ingredient}'
    response = RestClient.get"base-url"
    # define base url - http://api.yummly.com/v1/api/recipes?_app_id=app-id&_app_key=app-key&your _search_parameters
  end
end
