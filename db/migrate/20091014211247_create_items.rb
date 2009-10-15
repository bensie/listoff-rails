class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :todo_id
      t.text :content
      t.boolean :completed
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
