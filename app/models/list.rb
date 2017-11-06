class List < ApplicationRecord
	serialize :notes, JSON
	serialize :status, JSON
	validates_presence_of :title, :due, :notes, :status
end
