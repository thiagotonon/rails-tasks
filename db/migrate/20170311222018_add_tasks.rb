class AddTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :position

      t.timestamps null: false
    end
  end
end
