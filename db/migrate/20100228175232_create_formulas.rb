class CreateFormulas < ActiveRecord::Migration
  def self.up
    create_table :formulas do |t|
      t.integer :ingredient_id
      t.integer :ingredient_ammount

      t.references :formulable, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :formulas
  end
end
