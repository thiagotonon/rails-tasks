FactoryGirl.define do
  factory :task do
    sequence :position
    sequence(:title) { |n| "Task#{n}" }
  end
end