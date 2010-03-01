#A formula defines the relation between an object that is constructed by
#small parts of some ingredients. So an object that has formulas, can define
#how many parts of the ingredient uses.
class Formula < ActiveRecord::Base
  belongs_to :formulable, :polymorphic => true
  belongs_to :ingredient

  validates_presence_of :ingredient_id
  validates_presence_of :ingredient_ammount

end

# == Schema Information
#
# Table name: formulas
#
#  id                 :integer(4)      not null, primary key
#  ingredient_id      :integer(4)
#  ingredient_ammount :integer(4)
#  formulable_id      :integer(4)
#  formulable_type    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

