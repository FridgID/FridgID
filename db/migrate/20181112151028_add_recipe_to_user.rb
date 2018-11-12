class AddRecipeToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :recipe, foreign_key: true
  end
end
