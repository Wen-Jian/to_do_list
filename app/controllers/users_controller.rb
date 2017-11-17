class UsersController < ApplicationController

	def index
		
	end

	def create
		@users = User.all
		@userlogined = OnlineAccount.new
		@error = ""
		if params[:commit] == "login"

			if params[:login][:account] != "" && params[:login][:password] != "" 
				
				@users.each do |u|
					
					if u[:account] == params[:login][:account]
						
						if u[:password] == params[:login][:password]

							
							@userlogined[:user_id] = u[:id]

							@userlogined.save
							redirect_to user_lists_path(u)



						else

							@error = "Account or password is not correct"
							render :action => :index							

						end

					else

						@error = "Account or password is not correct"
						render :action => :index

					end

				end
				
			else

				@error = "Account or password can't be blank!"
				render :action => :index


			end

		else

			
			

		end

	end

	private

	def login_params
		
		 params.require(:login).permit(:account, :password)

	end

		
	
end
