class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "登録しました"
            # ログイン画面にリダイレクト
            redirect_to login_path
        else
           flash.now[:alert] = "登録に失敗しました"
           render "new"
        end
    end
    
end
