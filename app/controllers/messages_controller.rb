class MessagesController < ApplicationController
  
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end


  def create
    @room = Room.find(params[:room_id])
    #paramsに含まれているroom_idをインスタンス変数に代入する
    @message = @room.messages.new(message.params)
               #【room.messages.new】はチャットルームに紐づいたmessageという意味
    @message.save

    if @message.save
      redirect_to room_messages_path(@room)
      #メッセージの送信に成功した場合はindexに戻って新しくインスタンス変数を生成する
      #【room_messages_path】はindexへのパス
    else
      render :index
      #条件式にマッチしない(メッセージの送信に失敗した)場合はindexに遷移する
    end

  end


  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
    #current_userが入力したcontentをmessage_paramsに代入する

  end
 
end
