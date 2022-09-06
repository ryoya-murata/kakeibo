class UsersController < ApplicationController
    
    before_action :redirect_to_login, only:[:edit, :update]
    
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
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
       @user = User.find(params[:id])
       user_params = params.require(:user).permit(:name, :email)
       if @user.update(user_params)
           flash[:notice] = "更新しました"
           redirect_to edit_user_path(@user)
       else
            flash.now[:alert] = "更新に失敗しました"
            render "edit"
       end

    end
    
end
