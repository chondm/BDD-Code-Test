class Feature < ActiveRecord::Base
  validates_presence_of :title
  has_many :scenarios
  
  
end
