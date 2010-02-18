class Order < ActiveRecord::Base
  #An Order holds the information of a sell being made.

  belongs_to :user
  belongs_to :client

  #creates the client association for and order.
  validates_associated :client

  #Builds the new client information.
  def new_client_attributes=(client_attributes)
    client_attributes.each do |attr|
      build_client(attr)
    end
  end

  #Virtual attributes for client. For the autocompletion field
  def client_name
    client.name if client
  end

  def client_name=(name)
    self.client = Client.find_or_create_by_name(name) unless name.blank?
  end

end

# == Schema Information
#
# Table name: orders
#
#  id                :integer(4)      not null, primary key
#  status            :string(255)
#  registration_date :datetime
#  ammount           :integer(4)
#  client_id         :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
#

