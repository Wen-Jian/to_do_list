class List < ApplicationRecord
	serialize :notes 
	serialize :status	
	validates_presence_of :title, :due, :notes, :status
end
