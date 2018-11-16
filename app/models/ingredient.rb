class Ingredient < ApplicationRecord
  IN_SEASON = 2
  NEUTRAL = 1
  OUT_SEASON = 0

  # use me :)
  def seasonal
    return 1 if from_month == '' || to_month == '' # 1=neutral

    from = Date::MONTHNAMES.index(from_month)
    to = Date::MONTHNAMES.index(to_month)
    return Ingredient.season_month?(from, to, Date.today.month) ? 2 : 0
  end

  def self.season_stats(ingredients)
    oni = [0, 0, 0] # oni (out neutral in) season
    ingredients.each do |ing|
      if ing.seasonal == IN_SEASON
        oni[IN_SEASON] += 1
      elsif ing.seasonal == OUT_SEASON
        oni[OUT_SEASON] += 1
      else # ing.seasonal == NEUTRAL
        oni[NEUTRAL] += 1
      end
    end
    return oni
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
