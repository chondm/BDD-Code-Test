require 'spec_helper'

describe Scenario do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :given_block => "value for given block",
      :when_block => "value for when block",
      :then_block => "value for then blocks",
      :feature_id => 1
    }
    @existing_scenario = Scenario.create(@valid_attributes)
  end

  it "should enforce the presence of scenario" do
    scenario = Scenario.new (@valid_attributes)
    scenario.should be_valid   
  end
  
  it "should create a new instance given valid attributes" do
   Scenario.create!(@valid_attributes)
  end
  
   it "is not valid without a title" do
    @valid_attributes[:title] = nil
    scenario = Scenario.new(@valid_attributes)
    scenario.should_not be_valid
    
  end
  
  it "is not valid without a given_block" do
    @valid_attributes[:given_block] = nil
    scenario = Scenario.new(@valid_attributes)
    scenario.should_not be_valid
  end
  
  it "is not valid without a when_block" do
    @valid_attributes[:when_block] = nil
    scenario = Scenario.new(@valid_attributes)
    scenario.should_not be_valid
  end
  
  it "is not valid without a when_block" do
    @valid_attributes[:when_block] = nil
    scenario = Scenario.new(@valid_attributes)
    scenario.should_not be_valid
  end
  
   
end
