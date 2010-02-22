require 'test_helper'

class ProductPresentationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

