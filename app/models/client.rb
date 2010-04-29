# Author::    Miguel Pérez Leal  (mailto:miguel.perez.leal@gmail.com)
# Copyright:: Copyright (c) 2010 Miguel Pérez Leal

#This class represents a +client+ that migth have orders associated to him.
class Client < ActiveRecord::Base
  has_many :orders

  validates_presence_of :id_number
  validates_presence_of :name
  validates_presence_of :address
  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  
  def full_name
    "#{name} #{last_name}"
  end
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

