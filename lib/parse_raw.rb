# rubocop: disable all
require 'date'

# INGRS = {
#   potato: { from: 'from_month', to: 'to_month'}
# }
INGRS = {}

def show_result
  puts "show result"
  INGRS.each do |k, v|
    puts "[#{k}] #{v}"
  end
end

def add_ingr(ingr, month)
  ing = ingr.singularize
  if INGRS[ing.to_sym]
    # puts "* #{ing}"
    if INGRS[ing.to_sym][:swap] # special case
      puts "skip special for #{ingr}"
      return
    else # no special
      # check for special
      if INGRS[ing.to_sym][:to]
        if Date::MONTHNAMES.index(month) != Date::MONTHNAMES.index(INGRS[ing.to_sym][:to]) + 1
          INGRS[ing.to_sym][:to] = INGRS[ing.to_sym][:from]
          INGRS[ing.to_sym][:from] = month
          INGRS[ing.to_sym][:swap] = true
        end
      else
        if Date::MONTHNAMES.index(month) != Date::MONTHNAMES.index(INGRS[ing.to_sym][:from]) + 1
          INGRS[ing.to_sym][:to] = INGRS[ing.to_sym][:from]
          INGRS[ing.to_sym][:from] = month
          INGRS[ing.to_sym][:swap] = true
        end
      end
      puts "detect special for #{ingr}"
      return
    end
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
