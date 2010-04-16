# Author::    Miguel Pérez Leal  (mailto:miguel.perez.leal@gmail.com)
# Copyright:: Copyright (c) 2010 Miguel Pérez Leal

#A Company defines the information of the owner of some orders.
#The orders are payed to the company owner. And a user can have many companies.
class Company < ActiveRecord::Base
  belongs_to :user
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

