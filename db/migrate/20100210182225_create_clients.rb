class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :id_number
      t.string :name
      t.string :last_name
      t.string :address
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
