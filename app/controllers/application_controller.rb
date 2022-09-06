class ApplicationController < ActionController::Base
    
    # ログインしていない場合ログイン画面にリダイレクト
    def redirect_to_login
        redirect_to login_path if session[:user_id].blank?
    end
    
end
