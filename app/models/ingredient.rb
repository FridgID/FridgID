class Ingredient < ApplicationRecord
  # use me :)
  def seasonal?
    from = Date::MONTHNAMES.index(from_month)
    to = Date::MONTHNAMES.index(to_month)
    return Ingredient.season_month?(from, to, Date.today.month)
  end

  # only a helper
  def self.season_month?(from, to, now)
    return from == now if from == to
    return (from..to).cover?(now) if from < to

    # from > to
    return (from..(to + 12)).cover?(now + (now > from ? 0 : 12))
  end

  # active record
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, uniqueness: true
  validates :from_month, inclusion: {
    in: [
      '', # empty str for seasonless ingr like salt
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ]
  }
  validates :to_month, inclusion: {
    in: [
      '', # empty str for seasonless ingr like salt
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ]
  }
end
