require 'json'
require 'nokogiri'
require 'pry-byebug'

puts "[+] ----------- [start] ------------ [+]"
puts "[*] loading db ingredients..."
db_ingrs = []
data = JSON.parse(File.read('json/ingredients.json'))
data.each do |d|
  db_ingrs.push(d['name'])
end
puts "[+] loaded #{db_ingrs.count} ingredients!"

path = ARGV[0] ? ARGV[0] : 'html/001.html'

html_content = open(path).read
doc = Nokogiri::HTML(html_content)

title = "not found"
desc = "not found"
method = "not found"
metrics = []

doc.search('.recipe-intro').each do |element|
  # binding.pry
  desc =  element.children[0].text
end

noktitle = doc.search('.single-recipe-details .hidden-xs').first.text
if noktitle
  title = noktitle
end

e = doc.search('.recipe-container picture img')
img_url = e.first.attributes['src'].value[2..-2]
if e == []
  puts "error"
  exit
end

doc.search('.method-p').each do |element|
  method = []
  element.children.children.children.each do |li|
    if li.children[0]
      # puts li.children[0].text
      method.push(li.children[0].text)
    else
      puts "[*] skipping cookie banner"
      # puts "li.children[0] doesnt exist"
      # puts "probably cookie banner whatevery"
      # binding.pry
    end
  end
end

doc.search('.recipe-ingredients .ingred-list').each do |element|
  # binding.pry

  element.children.each_with_index do |child, i|
    if i % 2 != 0
      raw_ing = child.children.text
      col = raw_ing.split & db_ingrs
      if col != []
        puts "[+] collision found: #{col}"
        if col.count > 1
          puts "[!] WARNING! collision is bigger than 1"
        end
      else
        puts "[-] ingredient not found"
      end
      metrics.push(col[0], raw_ing)
    end
  end
end

puts "[+] finished '#{title}' !"
#puts "------------------------"
#puts "title: #{title}"
#puts "desc: #{desc}"
#puts "------------------------"
#puts "method: #{method}"
#puts "------------------------"
#puts "ingrs: #{metrics}"


rec_hash = {
  title: title,
  description: desc,
  method: method.join(' '),
  photo: img_url,
  metrics: metrics
}

File.open("json/scrape_recipes.json","w") do |f|
  f.write(JSON.pretty_generate(rec_hash))
end
