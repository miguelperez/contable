require 'test_helper'

class OrderProductPresentationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

