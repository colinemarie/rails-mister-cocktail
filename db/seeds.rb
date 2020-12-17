require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
parsing = JSON.parse(open(url).read)
ingredients = parsing['drinks']

puts 'cleaning'
Cocktail.destroy_all
Ingredient.destroy_all

puts 'adding ingredients...'

ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
  puts "Create #{ingredient['strIngredient1']}"
end

puts 'ingredients done'

# puts 'adding cocktail'

# amaretto = Cocktail.new(name: 'Amaretto Sour')
# mojito = Cocktail.new(name: 'Mojito')
# stgermain = Cocktail.new(name: 'St Germain spritz')
# americano = Cocktail.new(name: 'Americano')
# dark = Cocktail.new(name: 'Dark and Stormy')
# gimlet = Cocktail.new(name: 'Amaretto Sour')
# # article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
