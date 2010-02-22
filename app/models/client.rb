class Client < ActiveRecord::Base
  #Represents a client on the system.
  has_many :orders

  validates_presence_of :id_number
  validates_presence_of :name
  validates_presence_of :address
end


# == Schema Information
#
# Table name: clients
#
#  id         :integer(4)      not null, primary key
#  id_number  :string(255)
#  name       :string(255)
#  last_name  :string(255)
#  address    :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

