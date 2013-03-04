class Pledge < ActiveRecord::Base
	 attr_accessible :project_id,:hccommitted,:fundingorg,:commitdate
	 belongs_to :project
     validates :project_id, :hccommitted, :numericality => { :only_integer => true } 
    validates :fundingorg, :length => {:maximum => 255} 
    validates :project_id, :hccommitted, :fundingorg, :commitdate, :presence => true
end
