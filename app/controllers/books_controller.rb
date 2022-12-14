class BooksController < ApplicationController
    
    # 事前実行
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    before_action :redirect_to_login
    
    
    
    def index
       @books = Book.where(user_id: session[:user_id])
       @books = @books.where(year: params[:year]) if params[:year].present?
       @books = @books.where(month: params[:month]) if params[:month].present?
    end
    
    def show
        set_book
    end
    
    def new
        @book = Book.new
    end
    
    def create
        book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
        book_params[:user_id] = session[:user_id]
        # 新しいインスタンスの生成
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = "家計簿に" + @book.year.to_s + "年" + @book.month.to_s + "月" + @book.category + "のデータを登録しました"
            # 一覧画面へのリダイレクト
            redirect_to books_path
        else
            flash.now[:alert] = "登録に失敗しました"
            render :new
        end
        
    end
    
    def edit
        set_book
    end
    
    def update
        set_book
        book_params
        if @book.update(book_params)
            flash[:notice] = "データを更新しました"
            # 詳細画面へのリダイレクト
            redirect_to book_path
        else
            flash.now[:alert] = "データの更新に失敗しました"
            render :edit
        end
    end
    
    def destroy
        set_book
        @book.destroy
        flash[:notice] = "データを削除しました"
        redirect_to books_path
    end
    

    
    # このコントローラー内でしか使わないメソッド
    private
    
    def set_book
        @book = Book.where(user_id: session[:user_id]).find(params[:id])
    end
    

    def book_params
        # 該当データの検索
        book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
    end
    
end