class SessionController < ApplicationController
    
    before_action :redirect_to_books, only: [:new, :create]
    
    
    def new
        
    end
    
    # ログイン
    def create
        user = User.find_by(email: params[:email])
        # userが存在し、パスワードが一致した場合
        if user.present? && user.authenticate(params[:password])
            flash[:notice] = "ログインに成功しました"
            session[:user_id] = user.id
            redirect_to books_path
        else
            flash.now[:alert] = "ログインに失敗しました"
            render "new"
        end
    end
    
    # ログアウト
    def destroy
        session[:user_id] = nil
        redirect_to login_path
    end
    
    private
    
    # 家計簿一覧画面へのリダイレクト
    def redirect_to_books
        redirect_to books_path if session[:user_id].present?
    end
    
end
