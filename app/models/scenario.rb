class Scenario < ActiveRecord::Base
  validates_presence_of :title, :given_block, :when_block, :then_block
  belongs_to :feature, :foreign_key => "feature_id"
end
