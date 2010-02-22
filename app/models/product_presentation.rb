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

