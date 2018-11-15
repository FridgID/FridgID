class IngredientsController < ApplicationController
  def index
    query = params[:query].nil? ? '' : params[:query].downcase
    @ingredients = Ingredient.where("name LIKE :query", query: "%#{query}%").select(:name).limit(10).pluck(:name)

    respond_to do |format|
      format.html # <-- will render `app/views/ingredients/index.html.erb`
      format.json { render json: @ingredients } # will respond with array of results
    end
  end
end
