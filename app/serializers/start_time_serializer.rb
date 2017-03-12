class StartTimeSerializer < ActiveModel::Serializer
  attributes :id, :time

  belongs_to :task
end
