class List < ApplicationRecord
	serialize :notes
	serialize :status
	validates_presence_of :title, :due, :notes, :status, :user_id
	belongs_to :user, optional: true
end
