require 'spec_helper'

describe ScenariosController do
  def mock_scenario(stubs={})
    @mock_scenario ||= mock_model(Scenario, stubs)
  end
 
  #Delete this example and add some real ones
  it "should use ScenariosController" do
    controller.should be_an_instance_of(ScenariosController)
  end
  
  context 'GET new' do    
    it "render new template page with fearture as @feature" do
      feature = mock_model(Feature)
      Feature.stub(:find_by_id).with('10').and_return(feature)
      Scenario.stub(:new).and_return(mock_scenario)
      get :new , :id => 10
      assigns[:feature].should == feature
      assigns[:scenario].should == mock_scenario        
    end

  end
  
  context 'POST create' do    
      before(:each) do
      @valid_attributes = {
      "title" => "value for title",
      "given_block" => "value for given block",
      "when_block" => "value for when block",
      "then_block" => "value for then blocks"      
      }            
      @f_atrributes = {
      :id => 10,
      :title => "Another terse yet descriptive text of what is desired"
      }
      @scenario = mock_model(Scenario)
      Scenario.should_receive(:new).with(@valid_attributes).once.and_return(@scenario)           
    end
    
    it 'should redirect to index with a notice on successful save' do      
      feature = mock_model(Feature)
      Feature.should_receive(:update).with(10, :title => "Another terse yet descriptive text of what is desired").and_return(feature)       
      scenarios = mock("List of Scenarios of a feature")
      feature.should_receive(:scenarios).and_return(scenarios)
      scenarios.should_receive(:<<).with(@scenario).and_return scenarios       
      feature.should_receive(:save).and_return(true)       
      post :create, :scenario => @valid_attributes, :feature => @f_atrributes          
    end 
  end

end
