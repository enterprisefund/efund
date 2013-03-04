class Project < ActiveRecord::Base
    attr_accessible :title, :description,:hcneeded,:deadline,:requestingorg,:user_id
	belongs_to :user
	has_many :pledges
    validates :hcneeded, :deadline, :user_id, :numericality => { :only_integer => true } 
    validates :description, :requestingorg, :title, :length => {:maximum => 255} 
    validates :deadline, :title, :description, :requestingorg, :hcneeded,:user_id, :presence => true

end
