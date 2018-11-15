require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  # def season_month?(f, t, now)
  i = Ingredient

  # simple
  test "season_month? [6-(8)-10]" do
    assert i.season_month?(6, 10, 8) == true
  end

  test "season_month? [6-10] (11)" do
    assert i.season_month?(6, 10, 11) == false
  end

  # overlapping
  test "season_month? [10-(11)-1]" do
    assert i.season_month?(10, 1, 11) == true
  end

  test "season_month? (9) [10-1]" do
    assert i.season_month?(10, 1, 9) == false
  end

  test "season_month? [10-1] (2)" do
    assert i.season_month?(10, 1, 2) == false
  end

  test "season_month? [10-(2)-5]" do
    assert i.season_month?(10, 5, 2) == true
  end
end
