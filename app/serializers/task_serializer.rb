class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :position

  has_many :start_times
end
