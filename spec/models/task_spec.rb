require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task1 = create(:task, position: 1)
    @task2 = create(:task, position: 2)
    @task3 = create(:task, position: 3)
  end

  describe "#update_position" do
    it "sets a new position to the task" do
      @task1.update_position(3)
      expect(@task1.position).to eq(3)
    end

    it "reorders tasks with position higher than the new position" do
      @task1.update_position(3)
      @task2.reload
      @task3.reload

      expect(@task2.position).to eq(1)
      expect(@task3.position).to eq(2)
    end
  end

  describe "#retrieve new position" do
    it "sets a position to a new instance of Task" do
      task = described_class.new
      expect(task.position).to eq(4)
    end
  end

  describe "#spent_time_in_seconds" do
    it "returns 0 if task has no spent times" do
      task = create(:task)
      expect(task.spent_time_in_seconds).to eq(0)
    end

    it "returns the spent time in seconds" do
      task = create(:task)
      spent_time = create(:start_time, task: task)
      expect(task.spent_time_in_seconds).to eq(3484800)
    end
  end

end