# Author::    Miguel Pérez Leal  (mailto:miguel.perez.leal@gmail.com)
# Copyright:: Copyright (c) 2010 Miguel Pérez Leal

#An +Order+ holds the information of a sell being made.
class Order < ActiveRecord::Base
  belongs_to :client

  has_many :product_presentations, :through => :order_product_presentations
  has_many :order_product_presentations, :dependent => :destroy

  cattr_accessor :STATUSES

  #creates the client association for and order.
  validates_associated :client
  after_create :set_expiration_date
  
  #verify the total ammount of this order after creating or updating it
  after_create :verify_ammount_value
  after_update :verify_ammount_value

  #After creating an Order it checks that the total ammount of this order is
  #equal to the sum of the product_quantity times the unit_sold_price
  def verify_ammount_value
    total = 0
    total_ammount = order_product_presentations.inject(total) { |total, n| p total; p n; total += (n.quantity * n.unit_sold_price); total  }
    if self.ammount != total_ammount
      self.ammount = total_ammount
      save
    end
  end

  #After creating an order we have to set the expiration date of it.
  def set_expiration_date
    if !self.status.eql?('Paid')
      self.update_attribute('expiration_date', self.registration_date + 1.month)
    end
  end

  #When invoking Order.new we like to get its order_number set.
  def after_initialize()
    if(self.new_record?)
      maximum_order_number = Order.maximum(:order_number)
      self.order_number = maximum_order_number ? maximum_order_number + 1 : 1
      #also lets add a registration date
      self.registration_date = self.expiration_date = Time.now
    end
  end

  #Builds the new client information.
  def new_client_attributes=(client_attributes)
    client_attributes.each do |key, attr|
      if client
        client.attributes = attr
      else
        build_client
      end
    end
  end

  #Virtual attributes for client. For the autocompletion field
  def client_name
    client.name if client
  end

  def client_name=(name)
    self.client = Client.find_or_initialize_by_name(name) unless name.blank?
  end

  #Creates the products associated with this order
  def new_order_product_presentations_attributes=(product_presentation_attributes)
    product_presentation_attributes.each do |attributes|
      order_product_presentations.build(attributes)
    end
  end

  after_update :save_products
  def existing_order_product_presentations_attributes=(product_presentation_attributes)
    order_product_presentations.reject(&:new_record?).each do |product|
      attributes = product_presentation_attributes[product.id.to_s]
      if attributes
        product.attributes = attributes
      else
        order_product_presentations.delete(product)
      end
    end
  end

  def save_products
    order_product_presentations.each do |product|
      product.save(false)
    end
  end

  @@STATUSES = %w(
    Active
    Paid
    Debt
  )
end



# == Schema Information
#
# Table name: orders
#
#  id                :integer(4)      not null, primary key
#  order_number      :integer(4)      default(0)
#  status            :string(255)
#  registration_date :datetime
#  expiration_date   :datetime
#  ammount           :integer(4)
#  client_id         :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
#

