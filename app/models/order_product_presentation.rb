# Author::    Miguel Pérez Leal  (mailto:miguel.perez.leal@gmail.com)
# Copyright:: Copyright (c) 2010 Miguel Pérez Leal

#This class represents the relationship that exists between an order and the
#products being sold. Every object of this class must have at one order
class OrderProductPresentation < ActiveRecord::Base
  belongs_to :order
  belongs_to :product_presentation

  validates_presence_of :quantity
  validates_presence_of :unit_sold_price
  validates_uniqueness_of :product_presentation_id, :scope => :order_id

  #Returns the name of the product that was sold.
  def product_name
    return product_presentation.name if product_presentation
    return ""
  end

  #Returns the description of the product that was sold.
  def product_description
    return product_presentation.description if product_presentation
    return ""
  end

  #Returns the total ammount of this sold.
  def total_sold
    return (self.quantity * self.unit_sold_price) if(self.quantity && self.unit_sold_price)
    return ""
  end
end


# == Schema Information
#
# Table name: order_product_presentations
#
#  id                      :integer(4)      not null, primary key
#  order_id                :integer(4)
#  product_presentation_id :integer(4)
#  quantity                :integer(4)
#  unit_sold_price         :integer(4)
#  created_at              :datetime
#  updated_at              :datetime
#

