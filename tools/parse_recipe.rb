# rubocop: disable all
require 'json'
require 'rainbow'
require 'nokogiri'
require 'pry-byebug'
require 'rubygems'
require 'active_support/inflector'

def pok(str) # print ok
  puts "[" + Rainbow("+").green + "] " + str
end

def pwr(str) # print warning
  puts "[" + Rainbow("!").orange + "] " + str
end

def per(str) # print error
  puts "[" + Rainbow("-").red + "] " + str
end

def pif(str) # print info
  puts "[" + Rainbow("*").green + "] " + str
end

pok "----------- [start] ------------"
pif "loading db ingredients..."
$db_ingrs = []
$failed_metrics = []
data = JSON.parse(File.read('json/ingredients.json'))
data.each do |d|
  $db_ingrs.push(d['name'])
end
pok "create ingredient hash..."
$db_hash = $db_ingrs.map {|i| [i, i]}.to_h
pok "loaded #{$db_ingrs.count} ingredients!"

path = ARGV[0] ? ARGV[0] : 'html/001.html'
img_flag = false
if ARGV[1]
  img_flag = true if ARGV[1] == 'dl=img'
end

if img_flag
  pok "donwload image flag is ON"
else
  pif "download image flag is OFF"
end

file_num = path[path.index('/')+1..path.index('.')-1]

html_content = open(path).read
doc = Nokogiri::HTML(html_content)

title = "not found"
desc = "not found"
method = "not found"
$metrics = []

nokdesc = doc.search('.recipe-intro')
if nokdesc
  desc = nokdesc.children[0].text
else
  pif "desc not found try subheading"
  noksub = doc.search('.subheading')
  if noksub
    desc = noksub.children[0].text
    binding.pry
  else
    per "subheading not found!"
  end
end

noktitle = doc.search('.single-recipe-details .hidden-xs').first.text
if noktitle
  title = noktitle
else
  per "title not found"
end

e = doc.search('.recipe-container picture img')
img_url = e.first.attributes['src'].value[2..-2]
if e == []
  per "error image not found"
  exit
end

doc.search('.method-p').each do |element|
  method = []
  element.children.children.children.each do |li|
    if li.children[0]
      # puts li.children[0].text
      method.push(li.children[0].text)
    else
      pif "skipping cookie banner"
      # puts "li.children[0] doesnt exist"
      # puts "probably cookie banner whatevery"
      # binding.pry
    end
  end
end

def find_ingredient(ingredient_metric, ingredients)
  m = ingredient_metric #.split(' ')
  if m.count == 1
    pwr "WARNING only one word in metrics"
  end

  trigrams = m.each_slice(3).to_a + m[1..-1].each_slice(3).to_a + m[2..-1].each_slice(3).to_a
  digrams = m.each_slice(2).to_a + m[1..-1].each_slice(2).to_a
  grams = trigrams + digrams
  grams.each do |gram|
    if ingredient = ingredients[gram.join(" ")]
      return ingredient
    end
   end
   nil # could not find ingredient
end

def tridi_grams(ingrs, raw_ing)
  # TRIGRAMS AND DIGRAMS
  tridi = find_ingredient(ingrs, $db_hash)
  if !tridi
    pif "No tri or digrams"
  else
    pok "tridi found '#{tridi}'"
    $metrics.push([tridi, raw_ing])
    return true
  end
  false
end

def single_word(ingrs, raw_ing)
  col = ingrs & $db_ingrs
  return false if col == []
  pok "collision found: #{col}"
  if col.count > 1
    pwr "WARNING! collision is bigger than 1"
  end
  $metrics.push([col[0], raw_ing])
  true
end

doc.search('.recipe-ingredients .ingred-list').each do |element|
  # binding.pry

  element.children.each_with_index do |child, i|
    if i % 2 != 0
      raw_ing = child.children.text
      if raw_ing == raw_ing.upcase
        pwr "skip heading #{raw_ing}"
        next
      end
      # ingrs = raw_ing.split.map(&:singularize)
      ingrs = raw_ing.split.map do |i|
        if i[-1] == 'a'
          pif "PASTUM!!!!!!!!!!!!!!"
          i
        else
          i.singularize
        end
      end
      # TRIGRAMS AND DIGRAMS
      next if tridi_grams(ingrs, raw_ing)

      # SINGLE WORDS
      next if single_word(ingrs, raw_ing)

      # GSUB FALLBACK
      pif "fallback to gsub [,()]"
      ingrs = ingrs.map{ |a| a.gsub(/[,\(\)]/, '')}
      next if tridi_grams(ingrs, raw_ing)
      next if single_word(ingrs, raw_ing)

      per "ingredient not found"
      puts "ingrs: #{ingrs}"
      $failed_metrics.push(ingrs)
      # puts raw_ing.split.map(&:singularize)
      # $metrics.push(["ERROR", "NOT IN DB"])
    end
  end
end

img_url = "http://#{img_url}"
if img_flag
  img_path = "img/#{file_num}.jpg"
  pok 'downloading image...'
  `wget -O #{img_path} #{img_url}`
end


pok "finished '#{title}' !"
#puts "------------------------"
#puts "title: #{title}"
#puts "desc: #{desc}"
#puts "------------------------"
#puts "method: #{method}"
#puts "------------------------"
#puts "ingrs: #{$metrics}"


rec_hash = {
  title: title,
  description: desc,
  method: method, #.join(' '),
  photo: img_url,
  metrics: $metrics
}

File.open("json/scrape_recipes.json","a") do |f|
  f.write(JSON.pretty_generate(rec_hash))
  f.write(',')
  f.puts
end

if $failed_metrics.count > 0
  File.open('failed.txt', 'a') do |f|
    f.puts "===[ #{title} ]==="
    f.puts $failed_metrics.join(' ')
  end
end
