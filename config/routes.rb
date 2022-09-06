Rails.application.routes.draw do
    root to: 'books#index'
    
    # 家計簿データ
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
    
    # 会員登録
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    
    # 会員ログイン
    get "/login", to: "session#new"
    post "/login", to: "session#create"
    
    # 会員ログアウト
    get "/logout", to: "session#destroy"
    
    # 会員編集
    get "/users/edit", to: "users#edit", as: "edit_user"
    patch "/users", to: "users#update", as: "user"
    
    # routeの自動生成
    # resources :books
end