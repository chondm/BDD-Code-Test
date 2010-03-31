class FeaturesController < ApplicationController
  
  def index
    @features = Feature.all
  end
  
  def new
    @feature = Feature.new
  end
   def show
    @feature = Feature.find(params[:id])
  end
  
  def create  
    scenario = Scenario.new(params[:scenario])
    feature = Feature.new(params[:feature])    
    feature.scenarios <<  scenario   
    if feature.save     
      flash[:notice] = "New feature created."  
      redirect_to(features_url)
    else
      render :action => "new"
    end  
  end 
 
end
