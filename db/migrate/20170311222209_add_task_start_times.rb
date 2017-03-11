class AddTaskStartTimes < ActiveRecord::Migration
  def change
  	create_table :task_start_times do |t|
  		t.references :task

  		t.datetime :start_time

  		t.timestamps null: false
  	end
  end
end
