class Dish < ApplicationRecord
  validates_presence_of :name, :timePreparation, :price
  belongs_to :restaurant
  belongs_to :category
  has_and_belongs_to_many :ingredients
end
