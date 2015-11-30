Rails.application.routes.draw do
  get 'formatting_file/index'
  root 'formatting_file#index'

  resources :formatting_file do
    collection do
      post 'create'
    end
  end
end
