class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @message = Message.new 
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
        redirect_to room_messages_path(@room) #なぜredirect_to action: :indexではないのか？→引数＠roomを渡すため。URLは、rooms/@room.id/messagesとなるので、引数が必要。      else
        render :index
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
