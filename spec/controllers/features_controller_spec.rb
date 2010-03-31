require 'spec_helper'

describe FeaturesController do
  def mock_feature(stubs={})
    @mock_scenario ||= mock_model(Feature, stubs)
  end
  
  context "#index" do
    it "should provide an index method that returns all features to the view" do
      @features = Array.new(3) { Factory(:feature) }
      Feature.stub!(:find).and_return(@features)
      get :index
      assigns[:features].should == @features
    end
    it "should provide an index method that returns an empty array if there are no features" do
      get :index
      assigns[:features].empty?.should be(true)
    end
    it "should render the index template" do
      get :index
      response.should render_template(:index)
    end
  end
  
  
  context "GET new" do
    def do_get
      get :new
    end 
    it "should map {controller => 'features, :action => 'new' } to /features/new " do
      route_for(:controller => 'features', :action => 'new').should == '/features/new'
    end
    
    it "assigns a new feature as @feature" do
      mock_feature = mock("A feature")
      Feature.stub(:new).and_return(mock_feature)
      do_get
      assigns[:feature].should == mock_feature
    end
    
    it "should render the new template" do
      do_get
      response.should render_template(:new)
    end   
    
  end
 
  context "GET show" do     
    
    before do
      Feature.stub(:find).with('10').and_return(mock_feature)
      get :show, :id => 10
    end
    it "assigns the requested job as @task" do
      assigns[:feature].should == mock_feature
    end
  end
  
  context "POST create" do
    def do_post    
      post :create, :scenario => @valid_attributes, :feature => @f_atrributes 
    end
    before(:each) do
      @valid_attributes = {
      "title" => "value for title",
      "given_block" => "value for given block",
      "when_block" => "value for when block",
      "then_block" => "value for then blocks"      
      }            
      @f_atrributes = {   
      "title" => "Some terse yet descriptive text of what is desired"
      }
      @scenario = mock_model(Scenario)
      Scenario.should_receive(:new).with(@valid_attributes).once.and_return(@scenario) 
      
    end 
    it "should redirect to index with a notice on successful save" do
      feature = mock_model(Feature) 
      Feature.should_receive(:new).with(@f_atrributes).once.and_return(feature) 
      scenarios = mock("List of Scenarios of a feature")
      feature.should_receive(:scenarios).and_return(scenarios)
      scenarios.should_receive(:<<).with(@scenario).and_return scenarios       
      feature.should_receive(:save).and_return(true)       
      do_post
      flash[:notice].should == "New feature created."
      response.should redirect_to(features_path)
    end  
    
     it 'should re-render new template on failed save' do
      feature = mock_model(Feature) 
      Feature.should_receive(:new).with(@f_atrributes).once.and_return(feature) 
      scenarios = mock("List of Scenarios of a feature")
      feature.should_receive(:scenarios).and_return(scenarios)
      scenarios.should_receive(:<<).with(@scenario).and_return scenarios       
      feature.should_receive(:save).and_return(false)        
      do_post
      assigns[:task].should be(@task)
      flash[:notice].should be(nil)    
      response.should be_success
      response.should render_template('new')
    end  
 
  end
 
 
end
