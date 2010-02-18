class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :status
      t.datetime :registration_date
      t.integer :ammount

      t.integer :client_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
