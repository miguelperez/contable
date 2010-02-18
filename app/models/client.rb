class Client < ActiveRecord::Base
  #Represents a client on the system.
  has_many :orders
end

# == Schema Information
#
# Table name: clients
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  last_name  :string(255)
#  address    :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

