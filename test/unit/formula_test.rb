require 'test_helper'

class FormulaTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: formulas
#
#  id                 :integer(4)      not null, primary key
#  ingredient_id      :integer(4)
#  ingredient_ammount :integer(4)
#  formulable_id      :integer(4)
#  formulable_type    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

