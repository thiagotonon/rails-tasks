FactoryGirl.define do
  factory :start_time, class: "Task::StartTime" do
    task
    time { '2017-01-01 12:00:00'.to_datetime }
  end
end