class Order < ActiveRecord::Base
  #An Order holds the information of a sell being made.

  belongs_to :user
  belongs_to :client

  has_many :product_presentations, :through => :order_product_presentations
  has_many :order_product_presentations, :dependent => :destroy

  #creates the client association for and order.
  validates_associated :client

  #Builds the new client information.
  def new_client_attributes=(client_attributes)
    client_attributes.each do |attr|
      client = Client.find_or_initialize_by_name_and_last_name(client_attributes)
    end
  end

  #Virtual attributes for client. For the autocompletion field
  def client_name
    client.name if client
  end

  def client_name=(name)
    self.client = Client.find_or_create_by_name(name) unless name.blank?
  end

  #Creates the products associated with this order
  def new_product_attributes=(task_attributes)
    task_attributes.each do |attributes|
      product_presentations.build(attributes)
    end
  end

  after_update :save_product
  def existing_product_attributes=(task_attributes)
    product_presentations.reject(&:new_record?).each do |product|
      attributes = task_attributes[product.id.to_s]
      if attributes
        product.attributes = attributes
      else
        product_presentations.delete(product)
      end
    end
  end

  validates_associated :product_presentations

  def save_products
    product_presentations.each do |product|
      product.save(false)
    end
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

