class RoomsController < ApplicationController


  def index
  end

  def new
    @room = Room.new
    #インスタンス変数の生成。この時点でRoomの中身は空
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
      #room名とuser_idを受け取ったらtopページに戻る
    else
      render :new
      #条件式にマッチしない場合はnewアクションからやり直し
    end
  end

  def destroy
    room = Room.find(params[:id])
    #削除したいroomのidを取得
    room.destroy
    redirect_to root_path
  end


  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
    #paramsにはいる値を定義。この場合チャット名とuser_idになる。
  end

end
