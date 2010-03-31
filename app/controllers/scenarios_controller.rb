class ScenariosController < ApplicationController
  
  def new
    _id = params[:id]    
    @feature = Feature.find_by_id(_id)  
    @scenario = Scenario.new
  end
  def create  
    feature = params[:feature]    
    feature = Feature.update(feature["id"], :title => feature[:title])     
    scenario = Scenario.new(params[:scenario])
    feature.scenarios << scenario    
    feature.save    
    redirect_to(feature)   
  end

end
