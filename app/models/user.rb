# Author::    Miguel Pérez Leal  (mailto:miguel.perez.leal@gmail.com)
# Copyright:: Copyright (c) 2010 Miguel Pérez Leal

#This class represents a System user.
#Users, performs operations on the system. They have the ability to add
#+clients+, +orders+, +products+ and +ingredients+.

class User < ActiveRecord::Base
  include Clearance::User
  has_many :orders, :dependent => :destroy
  has_many :companies
  
  serialize :color
  
  attr_accessible :name
  attr_accessor :red, :green, :blue
  
  #TODO: use metaprogramming for things like this.
  #returns the ammount for green
  def green
    return self.color['green'] if self.color
    return 0
  end
  
  #returns the ammount for red
  def red
    return self.color['red'] if self.color
    return 0
  end
  
  #returns the ammount for blue
  def blue
    return self.color['blue'] if self.color
    return 0
  end
  
end



# == Schema Information
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  email              :string(255)
#  encrypted_password :string(128)
#  salt               :string(128)
#  confirmation_token :string(128)
#  remember_token     :string(128)
#  email_confirmed    :boolean(1)      default(FALSE), not null
#  created_at         :datetime
#  updated_at         :datetime
#  language           :string(255)     default("en")
#  name               :string(255)
#  color              :string(255)
#

