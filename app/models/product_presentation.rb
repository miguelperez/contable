# Author::    Miguel Pérez Leal  (mailto:miguel.perez.leal@gmail.com)
# Copyright:: Copyright (c) 2010 Miguel Pérez Leal

#The product presentation class represents the different forms a product can
#take. As an example we could cite:
#
#We have a product called Toilet paper which we can find in different presentations as:
# * Extra soft toilet paper
# * With perfume
# so in this example Toilet paper is the product and the above mentioned are the product presentations.
class ProductPresentation < ActiveRecord::Base
  belongs_to :product

  has_many :orders, :through => :order_product_presentations
  has_many :order_product_presentations, :dependent => :destroy

  has_many :formulas, :as => :formulable
  has_many :ingredients, :through => :formulas

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price
  
  after_update :save_formulas
  #--
  #Adding the methods for handling the upload of model formula trought product_presentations form
  #++

  #Creates the formula objects that will be associated with a product.
  def new_formula_attributes=(formula_attributes)
    formula_attributes.each do |attributes|
      formulas.build(attributes)
    end
  end

  #Updates or deletes the existing formula attributes associated with this product.
  def existing_formula_attributes=(formula_attributes)
    formulas.reject(&:new_record?).each do |formula|
      attributes = formula_attributes[formula.id.to_s]
      if attributes
        formula.attributes = attributes
      else
        formulas.delete(formula)
      end
    end
  end

  #Saves the edited formula.
  def save_formulas
    formulas.each do |formula|
      #the false param, bypasses validation.
      formula.save(false)
    end
  end

  #This is for ensuring at the end of the transaction that all the product
  #formulas gets validated, because on the +save_formula+
  #method we bypassed the validations.
  validates_associated :formulas

end


# == Schema Information
#
# Table name: product_presentations
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  product_id  :integer(4)
#  unit_price  :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

