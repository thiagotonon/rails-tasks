class SpentTimeSerializer < ActiveModel::Serializer
  attributes :id, :spent_time

  def spent_time
    object.spent_time_in_seconds.to_i
  end
end
