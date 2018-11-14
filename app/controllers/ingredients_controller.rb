class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.where("name LIKE :query", query: "%#{params[:query]}%").limit(10).pluck(:name)

    respond_to do |format|
      format.html # <-- will render `app/views/ingredients/index.html.erb`
      format.json { render json: @ingredients } # will respond with array of results
    end
  end
end
