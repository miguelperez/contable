class AddingLanguageFieldToUsers < ActiveRecord::Migration
  def self.up
    add_column(:users, :language, :string, :linmit => 10, :default => 'en')
  end

  def self.down
    remove_column(:users, :language)
  end
end
