class Project < ActiveRecord::Base 
	belongs_to :project_manager, :class_name => "User"
	has_many :conversations
	has_and_belongs_to_many :users, join_table: "participants"
	has_many :requests
	has_and_belongs_to_many :groups, join_table: "affiliations"

	def self.search(search)
  		where("name LIKE ?", "%#{search}%") - where(:privacy => "private")
  		#where("content LIKE ?", "%#{search}%")
	end
end 