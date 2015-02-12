class MessagesController < ApplicationController
	before_filter :authenticate_landlord!, only: [:new, :create, :destroy]

	def landlord_messages
		@messages = current_landlord.messages
	end

	def tenant_messages
		@messages = current_tenant.messages
	end

	def show
		@message = Message.find(params[:id])
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.create(message_params)
		MessageMailer.message_mail(@message).deliver_now
		redirect_to messages_path
	end

private

	def message_params
		params.require(:message).permit(:to, :from, :subject, :body)
	end
end

