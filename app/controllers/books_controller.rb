class BooksController < ApplicationController
    
    def index
        @books = Book.all
    end
    
    def show
        @book = Book.find(params[:id])
    end
    
    def new
        @book = Book.new
    end
    
    def create
        book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
        # 新しいインスタンスの生成
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = "家計簿に新規データを登録しました"
            # 一覧画面へのリダイレクト
            redirect_to books_path
        else
            flash.now[:alert] = "登録に失敗しました"
            render :new
        end
        
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        # 該当データの検索
        @book = Book.find(params[:id])
        book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
        if @book.update(book_params)
            flash[:notice] = "データを更新しました"
            # 一覧画面へのリダイレクト
            redirect_to books_path
        else
            flash.now[:alert] = "データの更新に失敗しました"
            render :edit
        end
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:notice] = "データを削除しました"
        redirect_to books_path
    end
    
end