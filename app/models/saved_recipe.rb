class SavedRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient

  validates_uniqueness_of :user_id, scope: :ingredient_id
end
