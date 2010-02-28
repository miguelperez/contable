#A formula defines the relation between an object that is constructed by
#small parts of some ingredients. So an object that has formulas, can define
#how many parts of the ingredient uses.
class Formula < ActiveRecord::Base
  belongs_to :formulable, :polymorphic => true
  has_many :ingredients
end
