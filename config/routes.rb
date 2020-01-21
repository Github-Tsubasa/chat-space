Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'groups#index'
  resources :users, only: [:edit, :update]
  # resources :groups, only: [:new, :create]
  resources :groups, only: [:index, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end

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
