Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
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
