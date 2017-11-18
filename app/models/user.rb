class User < ApplicationRecord

	has_many :lists
	has_many :user_eventships
	has_many :events, :through => :user_eventships

end
