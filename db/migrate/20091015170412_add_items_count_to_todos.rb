class AddItemsCountToTodos < ActiveRecord::Migration
  def self.up
    add_column :todos, :items_count, :integer, :default => 0
  end

  def self.down
    remove_column :todos, :items_count
  end
end
