class UsersController < ApplicationController

	def index
		session[:uid] = nil
		session[:select] = nil
	end

	def create
		@users = User.all
		@error = ""
		if params[:commit] == "login"

			if params[:login][:account] != "" && params[:login][:password] != "" 
				
				@user = User.find_by( account: params[:login] [:account])
				if @user 
					
					authenticate(params[:login][:password])

					respond_to do |f|

						@lists = List.where("user_id = #{@user.id}")
						f.json { render :json => {:user => @user, :list => @lists}}
						f.html { redirect_to user_lists_path(session[:uid])}

					end

							
				
				else

					@error = "Account or password is not correct"
					render :action => :index						

				end
				
			else

				@error = "Account or password can't be blank!"
				render :action => :index

			end

		else

			@user = User.new(sign_up_params)
			if @user.save

				redirect_to :action => :index

			else

				render :action => :new

			end

			
			
			

		end

	end

	def new


		
	end

	private

	def authenticate(password)
		
		 if password == @user[:password]

		 	session[:account] = @user.account
		 	session[:uid] = @user.id

		 end

	end

	def sign_up_params

		params.require(:sign_up).permit(:account, :password, :nickname, :sex, :birth)
		
	end
		
	
end
