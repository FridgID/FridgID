class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.where("name LIKE :query", query: "%#{params[:query]}%").select(:name).limit(10)
    @ingredients = @ingredients.map(&:name)

    respond_to do |format|
      format.html # <-- will render `app/views/ingredients/index.html.erb`
      format.json { render json: @ingredients } # will respond with array of results
    end
  end
end
