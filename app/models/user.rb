class User < ActiveRecord::Base
	attr_accessible :wwid, :name,:organization,:email
	has_many :projects
	validates :wwid, :length => {:minimum => 8, :maximum => 8} 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :wwid, :numericality => { :only_integer => true } 
    validates :name, :organization, :email, :length => {:maximum => 255} 
    validates :wwid, :name, :organization, :email, :presence => true
end
