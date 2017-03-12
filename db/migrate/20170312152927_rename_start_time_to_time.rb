class RenameStartTimeToTime < ActiveRecord::Migration
  def change
  	rename_column :task_start_times, :start_time, :time
  end
end
