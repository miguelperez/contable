class ClearanceUpdateUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
    end
    add_column(:users, :name, :string, :linmit => 50)
  end

  def self.down
    change_table(:users) do |t|
    end
    remove_column(:users, :name)
  end
end
