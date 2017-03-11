class StartTimeSerializer < ActiveModel::Serializer
  attributes :id, :start_time

  belongs_to :task
end
