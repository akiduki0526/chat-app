class RoomsController < ApplicationController

  def new
    @room = Room.new
    #インスタンス変数の生成。この時点でRoomの中身は空
  end

end
