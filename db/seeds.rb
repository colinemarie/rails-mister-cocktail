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
