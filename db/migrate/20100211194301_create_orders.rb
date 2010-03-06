class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer  :order_number, :default => 0
      t.string   :status
      t.datetime :registration_date
      #the expiration date is suppoused to be date this order expires. Which means
      #the associated client must pay the order.
      t.datetime :expiration_date
      t.integer  :ammount


      t.integer  :client_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end