class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, uniqueness: true
  validates :from_month, inclusion: {
    in: [
      '', # empty str for seasonless ingr like salt
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'september',
      'october',
      'november',
      'december'
    ]
  }
  validates :to_month, inclusion: {
    in: [
      '', # empty str for seasonless ingr like salt
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'september',
      'october',
      'november',
      'december'
    ]
  }
end
