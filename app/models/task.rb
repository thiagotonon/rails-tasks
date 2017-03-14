class Task < ActiveRecord::Base
  has_many :start_times

  validates_presence_of :title, :position

  def initialize(params={})
    super
    self.position = retrieve_new_position unless position
  end

  def reorder(new_position)
    query = <<-SQL
      UPDATE tasks
      SET position = CASE
        WHEN title = '#{title}' THEN #{new_position}
        WHEN position >= #{new_position} AND position <= #{position} AND title <> '#{title}' THEN position + 1
        WHEN position <= #{new_position} AND position >= #{position} AND title <> '#{title}' THEN position - 1
        ELSE position
      END;
    SQL
    ActiveRecord::Base.connection.update(query)
  end

  def spent_time_in_seconds
    query = <<-SQL
      SELECT EXTRACT(EPOCH FROM '2017-02-10 20:00:00'::timestamp-time::timestamp)
      FROM task_start_times
      WHERE task_start_times.task_id = #{id};
    SQL
    result = ActiveRecord::Base.connection.execute(query)
    return result.values.flatten
  end

  private

    def retrieve_new_position
      Task.any? ? Task.all.maximum(:position) + 1 : 0
    end
end