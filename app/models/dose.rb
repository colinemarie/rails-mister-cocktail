class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates_presence_of :description, :ingredient_id, :cocktail_id
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
end
