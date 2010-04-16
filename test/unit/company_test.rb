require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: companies
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  id_number      :string(255)
#  city           :string(255)
#  address        :string(255)
#  phone          :integer(4)
#  account_number :string(255)
#  owner_name     :string(255)
#  user_id        :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#

