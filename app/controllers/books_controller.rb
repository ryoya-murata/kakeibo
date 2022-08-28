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
            # 一覧画面へのリダイレクト
            redirect_to books_path
        else
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
            # 一覧画面へのリダイレクト
            redirect_to books_path
        else
            render :edit
        end
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end
    
end