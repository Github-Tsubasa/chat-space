Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  root  'users#index'

    def show_last_message
      if (last_message = messages.last).present?
        if last_message.content?
          last_message.content
        else
          '画像が投稿されています'
        end
      else
        'まだメッセージはありません。'
      end
    end
  end
end
