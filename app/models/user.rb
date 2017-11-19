class User < ApplicationRecord

	validates_presence_of :account, :password, :nickname, :sex, :birth
	has_many :lists
	has_many :user_eventships
	has_many :events, :through => :user_eventships

end
