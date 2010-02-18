class CreateProductPresentations < ActiveRecord::Migration
  def self.up
    create_table :product_presentations do |t|
      t.string :name
      t.string :description
      t.integer :product_id
      t.integer :unit_price
      
      t.timestamps
    end
  end

  def self.down
    drop_table :product_presentations
  end
end
