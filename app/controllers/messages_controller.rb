class MessagesController < ApplicationController
  def index
     @message = Message.new
     @room = Room.find(params[:room_id])
     @messages = @room.messages.includes(:user)
     #チャットルームに紐づいている全てのメッセージ。ユーザー情報も紐づいている
     #includes(:user)とすることでユーザー情報を一度のみの取得で終わらせれる
     #※でないとN＋1問題になり、処理に時間がかかる。
   end
 
   def create
     @room = Room.find(params[:room_id])
     #createメソッドないでもインスタンス変数は定義してあげないといけない
     @message = @room.messages.new(message_params)
     
     if @message.save
       redirect_to room_messages_path(@room)
     else
       @messages = @room.messages.includes(:user)
       #ユーザー情報を保持しつつ、indexアクションに戻れる。
       #そのときに@messagesが定義されていないとエラーになってしまいます？
       render :index
     end
   end
 
 
   private
 
   def message_params
     params.require(:message).permit(:content).merge(user_id: current_user.id)
   end
 end
 
