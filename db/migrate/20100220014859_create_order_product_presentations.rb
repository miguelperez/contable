class CreateOrderProductPresentations < ActiveRecord::Migration
  def self.up
    create_table :order_product_presentations do |t|
      t.integer :order_id
      t.integer :product_presentation_id
      t.integer :quantity
      #The price in which this product was sold
      t.integer :unit_sold_price
      t.timestamps
    end
  end

  def self.down
    drop_table :order_product_presentations
  end
end
