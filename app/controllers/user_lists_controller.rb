class UserListsController < ApplicationController

	def index

		@time = Time.now
		
		set_list
		@complete_array = []
		@lists.each do |e|
			 
			complete_rate = 0.0
			e[:status].each do |i|

				if i == true
					complete_rate += 1
					
				end
					
			end

		complete_rate = (complete_rate / (e[:notes].count)) * 100
				
		@complete_array.append(complete_rate)

		@sum = ((@list.due).year - @time.year) * 400 + ((@list.due).month - @time.month) * 30 + ((@list.due).day - @time.day)
		
		

		end
		
	end
	def new

		@list = List.new


	end
	def create
		
		notes_to_array
		status_init
		params[:list][:user_id] = session[:uid]
		
		@list = List.new(list_params)
		
		
		
		if @list.save 
			@list.save
			redirect_to user_lists_path(session[:uid])
		else
			render :action => :new
		end


	end
	def show
		
		session[:select] = params[:id].to_i - 1
		
		
		redirect_to :action => :index

		
	end
	def edit
		@list[:notes] = (@list[:notes]).join("\r\n")
		
	end
	def update
		
		statusarray = @list.status
		if params[:commit] == "Check"
			
			if 	params[:status] != nil			
				
				(params[:status]).each do |p|

					statusarray[p.to_i] = true

				end
				
				@list.status = statusarray
				
			end	
			@list.save
			redirect_to lists_path

		else
			notes_to_array
			
			if @list.update_attributes(list_params)
			
				redirect_to lists_path
			else
				render :action => :edit
			end
		end
		
	end

	def destroy

		@list.destroy
		@select = Selectparam.first
		@select[:params] = 0
		@select.save
		redirect_to lists_path
		
	end

	private

	def list_params

		params.require(:list).permit(:title, :due, :user_id, :notes => [], :status => [])
		

	end
	
	def set_list

		if session[:select] != nil

			@lists = (List.where(user_id: session[:uid] )).order("due ASC")
			@list = @lists[(session[:select].to_i)]			

		end
		
	end

	def notes_to_array
		e = params[:list]
		e[:notes] = e[:notes].split(%r{\r\n*})
				
	end
	def status_init

		e = params[:list]
		e[:status] = Array.new((e[:notes]).count, "false")
		
	end
	def status_params

		
	end
end


