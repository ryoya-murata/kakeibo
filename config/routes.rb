Rails.application.routes.draw do
     root 'books#index'
    
    get "/books", to: "books#index"
    # 新規作成
    post "/books", to: "books#create"
    get "/books/new", to: "books#new", as: "new_book"
    get "/books/:id/edit", to: "books#edit", as: "edit_book"
    get "/books/:id", to: "books#show", as: "book"
    # 更新
    patch "/books/:id", to: "books#update"
    # 削除
    delete "/books/:id", to: "books#destroy"
    
    # routeの自動生成
    # resources :books
end