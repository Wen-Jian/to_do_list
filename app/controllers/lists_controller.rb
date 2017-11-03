class ListsController < ApplicationController
	before_action :set_list, :only => [:edit, :update, :destroy]
	def index
		@time = Time.now
		@lists = List.order("due ASC")
		@select = Selectparam.find(1)
		if @select[:params] != 0 
			if List.find(@select[:params])!= nil
				@list = List.find(@select[:params])

			else
				@list = nil
			end
		end
		@sum = ((@list.due).year - @time.year) * 400 + ((@list.due).month - @time.month) * 30 + ((@list.due).day - @time.day)
	end
	def new

		@list = List.new


	end
	def create
		
		notes_to_array
		status_init
		
		@list = List.new(list_params)

		
		
		if @list.save 
			redirect_to lists_path
		else
			render :action => :new
		end


	end
	def show
		@selectparams = Selectparam.first
		@selectparams[:params] = params[:id]
		@selectparams.save
		redirect_to lists_path
		
	end
	def edit
		@list[:notes] = (@list[:notes]).join("\r\n")
		
	end
	def update
		
		if params[:commit] == "Check"
			
			if 	params[:status] != nil			
				
				
				(params[:status]).each do |p|

					
					(@list.status)[p.to_i] = true
					
				end	
				@list.save
				redirect_to lists_path


					
				

			end	
			
			
			

		else
			notes_to_array
			
			if @list.update_attributes(list_params)
			
				redirect_to lists_path
			else
				render :action => :edit
			end
		end
		debugg
	end

	def destroy

		@list.destroy
		@select = Selectparam.first
		@select[:params] = 0

		redirect_to lists_path
		
	end

	private

	def list_params

		params.require(:list).permit(:title, :due, :notes => [], :status => [])
		

	end
	
	def set_list
		@list = List.find(params[:id])
		
	end

	def notes_to_array
		e = params[:list]
		e[:notes] = e[:notes].split(%r{\r\n*})
				
	end
	def status_init

		e = params[:list]
		e[:status] = Array.new((e[:notes]).count, false)
		
	end
	def status_params

		
	end
end

