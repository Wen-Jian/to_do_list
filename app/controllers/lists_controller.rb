class ListsController < ApplicationController
	before_action :set_list, :only => [:edit, :update, :destroy]
	def index
		@time = Time.now
		@lists = List.all
		@select = Selectparam.find(1)
		if @select[:params] != 0 
			if List.find(@select[:params])!= nil
				@list = List.find(@select[:params])
			else
				@list = nil
			end
		end
	end
	def new

		@list = List.new


	end
	def create
		
		e = params[:list]
		e[:notes] = e[:notes].split(%r{\r\n*})
		
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
		
	end
	def update
		if @list.update_attributes(list_params)
			redirect_to lists_path
		else
			render :action => :edit
		end
		
	end

	def destroy

		@list.destroy
		@select = Selectparam.first
		@select[:params] = 0

		redirect_to lists_path
		
	end

	private

	def list_params

		params.require(:list).permit(:title, :due, :notes => [])
		

	end
	
	def set_list
		@list = List.find(params[:id])
		
	end


end

