class List < ApplicationRecord
	serialize :notes, Array
	serialize :status, Array
	validates_presence_of :title, :due, :notes, :status
end
