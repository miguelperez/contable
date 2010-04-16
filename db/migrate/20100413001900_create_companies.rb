class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :id_number
      t.string :city
      t.string :address
      t.integer :phone
      
      #information for the owner of the company... Not the user
      t.string :account_number
      t.string :owner_name
      
      #information of the creator of the company
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
