require 'task'
require 'pg'

DB = PG.connect(:dbname => 'to_do_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe Task do
  it 'is initialized with a name and list ID' do
    test_task = Task.new('learn SQL', 1)
    test_task.should be_an_instance_of Task
  end

  it 'tells you its name' do
    test_task = Task.new('learn SQL', 1)
    test_task.name.should eq 'learn SQL'
  end

  it 'tells you its list ID' do
    test_task = Task.new('learn SQL', 1)
    test_task.list_id.should eq 1
  end

  it 'starts with no tasks' do
    Task.all.should eq []
  end

  it 'lets you save tasks to the database' do
    test_task = Task.new('learn SQL', 1)
    test_task.save
    Task.all.should eq [test_task]
  end

  it 'is the same task if it has the same name and list_id' do
    task1 = Task.new('learn SQL', 1)
    task2 = Task.new('learn SQL', 1)
    task1.should eq task2
  end
end
