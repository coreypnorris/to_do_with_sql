require 'spec_helper'

describe List do
  it 'is initialized with a name' do
    test_list = List.new('Epicodus stuff')
    test_list.should be_an_instance_of List
  end

  it 'tells you its name' do
    test_list = List.new('Epicodus stuff')
    test_list.name.should eq 'Epicodus stuff'
  end

  it 'is the same list if it has the same name' do
    list1 = List.new('Epicodus stuff')
    list2 = List.new('Epicodus stuff')
    list1.should eq list2
  end

  it 'starts off with no lists' do
    List.all.should eq []
  end

  it 'lets you save lists to the database' do
    test_list = List.new('Epicodus stuff')
    test_list.save
    List.all.should eq [test_list]
  end

  it 'sets its ID when you save it' do
    list = List.new('Epicodus stuff')
    list.save
    list.id.should be_an_instance_of Fixnum
  end

end
