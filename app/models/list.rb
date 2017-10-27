class List < ApplicationRecord
	serialize :notes 
	serialize :status
	validates_presence_of :title, :date, :description, :file_location
end
