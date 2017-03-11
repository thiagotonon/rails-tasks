class Task < ActiveRecord::Base
  has_many :start_times

  validates_presence_of :title
end