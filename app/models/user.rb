class User < ActiveRecord::Base
  #A System user. Users, performs operations on the system.

  include Clearance::User
  has_many :orders, :dependent => :destroy
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
#

