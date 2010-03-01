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

