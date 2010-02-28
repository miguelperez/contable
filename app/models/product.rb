#A product holds the information of the assets of the application
class Product < ActiveRecord::Base
  has_many :formulas, :as => :formulable
  has_many :product_presentations

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
  #presentations gets validated, because on the save_product_presentations
  #method we bypassed the validations.
  validates_associated :product_presentations
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

