class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @message = Message.new 
    @messages = @room.messages.includes(:user) #@room.messagesで、このチャットルームに紐づいているmessagesを取得する
  end

  def create
    @room = Room.find(params[:room_id]) #引数＠roomには、「１」「２」「３」・・・等、roomのIDが入る
    @message = @room.messages.new(message_params)
    if @message.save
        redirect_to room_messages_path(@room) #なぜredirect_to action: :indexではないのか？→引数＠roomを渡すため。URLは、rooms/@room.id/messagesとなるので、引数が必要。
        else
        @messages = @room.messages.includes(:user)  #投稿に失敗した@messageの情報を保持しつつindex.html.erbを参照することがでる（この時、indexアクションは経由ない）
        render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
