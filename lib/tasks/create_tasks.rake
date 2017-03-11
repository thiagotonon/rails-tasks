namespace :tasks do
  task :create => :environment do
    task1 = Task.create!(title: 'task1', position: 1)
    task2 = Task.create!(title: 'task2', position: 2)
    task3 = Task.create!(title: 'task3', position: 3)
    task4 = Task.create!(title: 'task4', position: 4)
    task5 = Task.create!(title: 'task5', position: 5)
    task6 = Task.create!(title: 'task6', position: 6)
    task7 = Task.create!(title: 'task7', position: 7)

    Task::StartTime.create(task: task7, start_time: Time.new('2017-01-01 12:00:00'))
    Task::StartTime.create(task: task5, start_time: Time.new('2017-01-01 12:50:00'))
    Task::StartTime.create(task: task2, start_time: Time.new('2017-01-03 16:00:00'))
    Task::StartTime.create(task: task6, start_time: Time.new('2017-01-10 19:20:00'))
    Task::StartTime.create(task: task1, start_time: Time.new('2017-01-10 19:36:00'))
    Task::StartTime.create(task: task7, start_time: Time.new('2017-02-10 19:50:00'))
  end
end