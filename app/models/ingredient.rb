# Author::    Miguel Pérez Leal  (mailto:miguel.perez.leal@gmail.com)
# Copyright:: Copyright (c) 2010 Miguel Pérez Leal

#This class represents the main components that form a +product+ or a
#+product_presentation+. 
class Ingredient < ActiveRecord::Base
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

