require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end



# == Schema Information
#
# Table name: orders
#
#  id                :integer(4)      not null, primary key
#  order_number      :integer(4)      default(0)
#  status            :string(255)
#  registration_date :datetime
#  expiration_date   :datetime
#  ammount           :integer(4)
#  client_id         :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
#

