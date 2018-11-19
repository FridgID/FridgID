# rubocop: disable all
require 'date'

# INGRS = {
#   potato: { from: 'from_month', to: 'to_month'}
# }
INGRS = {}

def show_result
  INGRS.each do |k, v|
    puts "[#{k}] #{v}"
  end
end

def add_ingr(ingr, month)
  ing = ingr.singularize
  if INGRS[ing.to_sym]
    # puts "* #{ing}"
    INGRS[ing.to_sym][:to] = month
  else
    # puts "+ #{ing}"
    INGRS[ing.to_sym] = { from: month, to: month }
  end
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
      add_ingr(d, Date::MONTHNAMES[current_month])
    end
    if current_month.nil?
      puts "First item has to be a month"
      exit
    end
  end
end

parse_raw
show_result
