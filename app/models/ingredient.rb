class Ingredient < ActiveRecord::Base
  belongs_to :formula
end

# == Schema Information
#
# Table name: ingredients
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  unit        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

