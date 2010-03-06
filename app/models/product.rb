# Author::    Miguel Pérez Leal  (mailto:miguel.perez.leal@gmail.com)
# Copyright:: Copyright (c) 2010 Miguel Pérez Leal

#This class represents a product which holds the information of a product
#entered to the application

class Product < ActiveRecord::Base
  has_many :formulas, :as => :formulable
  has_many :product_presentations
  has_many :ingredients, :through => :formulas

  after_update :save_product_presentations

  #Creates the products presentations objects that will be associated with a
  #product.
  def new_product_presentation_attributes=(product_presentation_attributes)
    product_presentation_attributes.each do |attributes|
      product_presentations.build(attributes)
    end
  end

  #Updates or deletes the existing product presentations attributes associated
  #with this product.
  def existing_product_presentation_attributes=(product_presentation_attributes)
    product_presentations.reject(&:new_record?).each do |product_presentation|
      attributes = product_presentation_attributes[product_presentation.id.to_s]
      if attributes
        product_presentation.attributes = attributes
      else
        product_presentations.delete(product_presentation)
      end
    end
  end

  #Saves the edited product presentations.
  def save_product_presentations
    product_presentations.each do |product_presentation|
      #the false param, bypasses validation.
      product_presentation.save(false)
    end
  end

  #This is for ensuring at the end of the transaction that all the product
  #presentations gets validated, because on the +save_product_presentations+
  #method we bypassed the validations.
  validates_associated :product_presentations

  #--
  #Adding the methods for handling the upload of model formula trought products form
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
  def save_formula
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
# Table name: products
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

