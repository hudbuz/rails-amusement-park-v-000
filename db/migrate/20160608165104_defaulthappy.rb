class Defaulthappy < ActiveRecord::Migration
  def change
    remove_column :users, :happiness
    remove_column :users, :nausea
    remove_column :users, :tickets
    add_column :users, :tickets, :integer, :default => 0
    add_column :users, :happiness, :integer, :default => 0
    add_column :users, :nausea, :integer, :default => 0
  end
end
