class Task::StartTime < ActiveRecord::Base
  belongs_to :task

  validates_presence_of :time
end