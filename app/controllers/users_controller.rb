class UsersController < ApplicationController

def edit #user情報の編集
  #ビューファイルの表示だけなので中身は不要
end

def update
  if current_user.update(user_params)
   #条件：ユーザー情報をuser_paramsにアップデートするとき
    redirect_to root_path
    #true(アップデート)できたらtopページに戻る
    #補足：redirect_toはルーティング→コントローラー→ビューの順序で戻る

  else
    render :edit
    #updateできない場合は編集画面に遷移する(やり直し)
    #補足：renderは直接ビュー画面に戻る
  end
  end

private

  def user_params
    params.require(:user).permit(:name, :email)
    #補足説明：params.require(:モデル名)  →取得したい情報を指定する
     #permitメソッド→取得したいキーを指定できる
  end
end

