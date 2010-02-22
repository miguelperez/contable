class OrderProductPresentation < ActiveRecord::Base
  belongs_to :order
  belongs_to :product_presentation

  validates_presence_of :order
  validates_presence_of :product_presentation
#  validates_presence_of :quantity
#  validates_presence_of :unit_sold_price
  validates_uniqueness_of :product_presentation_id, :scope => :order_id
end

# == Schema Information
#
# Table name: order_product_presentations
#
#  id                      :integer(4)      not null, primary key
#  order_id                :integer(4)
#  product_presentation_id :integer(4)
#  created_at              :datetime
#  updated_at              :datetime
#

