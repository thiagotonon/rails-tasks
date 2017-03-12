class Task < ActiveRecord::Base
  has_many :start_times

  validates_presence_of :title, :position

  def initialize(params={})
    super
    self.position = retrieve_new_position unless position
  end

  def update_position(position)
    old_position = self.position
    update_attribute(:position, position)
    
    reorder_tasks(self, old_position)
  end

  def spent_time_in_seconds
    return 0 if start_times.empty?
    end_time = '2017-02-10 20:00:00'.to_datetime

    start_time = start_times.first.time.to_datetime
    return ((end_time - start_time) * 24 * 60 * 60).to_i
  end

  private

    def reorder_tasks(task, old_position)
      to_decrease = Task.where("position > ? and title <> ?", old_position, task.title)
      to_increase = Task.where("position >= ? and position <= ? and title <> ?", task.position, old_position, task.title)

      to_increase.each do |task|
        task.update_attribute(:position, task.position + 1)
      end

      to_decrease.each do |task|
        task.update_attribute(:position, task.position - 1)
      end
    end

    def retrieve_new_position
      Task.any? ? Task.all.maximum(:position) + 1 : 0
    end
end