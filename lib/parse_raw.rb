require 'date'

class Ingr
  def initialize(name, from, to)
    @name = name
    @from = from
    @to = to
  end
end

ingrs = []

def add_ingr(ingr, month)
  # if ingrs.map(&:name).include? ingr
end

def parse_raw
  data = File.read('lib/raw/ingredients.txt')
  data = data.split.map do |d|
    if (d[-1] == ',') || (d[-1] == '.')
      d[0..-2]
    else
      d
    end
  end
  current_month = nil
  data.each do |d|
    month = Date::MONTHNAMES.index(d)
    if month
      current_month = month
    else # ingredient
      add_ingr(d, current_month)
    end
    if current_month.nil?
      puts "First item has to be a month"
      exit
    end
  end
end

parse_raw
