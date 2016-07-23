class ChatroomsController < ApplicationController
	
	def index
		@chatroom 	= Chatroom.new
		@chatrooms 	= Chatroom.all
	end

	def show
		@chatroom 	= Chatroom.find_by_id(params[:id])
		@message 	= Message.new
	end

	def new
		flash[:notice] = nil if request.referrer.split("/").last == "chatrooms"
		@chatroom = Chatroom.new
	end

	def edit
		@chatroom = Chatroom.find_by_id(params[:id])
	end

	def create
		@chatroom = Chatroom.new(chatroom_params)
		if @chatroom.save
			redirect_to chatroom_path(@chatroom)
		else
			redirect_to show_path, notice: "Chatroom already exists"
		end
	end

	def update
		@chatroom = Chatroom.find_by_id(params[:id])
		@chatroom.update(chatroom_params)
		redirect_to @chatroom
	end

	private

	def chatroom_params
		params.require(:chatroom).permit(:topic)
	end

end
