class AddTodoIndexToItems < ActiveRecord::Migration
  def self.up
    add_index :items, :todo_id
  end

  def self.down
    remove_index :items, :todo_id
  end
end
