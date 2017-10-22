class ListsController < ApplicationController

	def index

		@lists = List.all
		@select = Selectparam.find(1)
		@list = List.find(@select[:params])
		
	end
	def new

		@list = List.new


	end
	def create

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
	
	private

	def list_params

		params.require(:list).permit(:title, :due, :notes)
		
	end

end

