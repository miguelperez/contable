class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |t|
      t.string :name
      t.string :description
      t.string :unit

      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients
  end
end
