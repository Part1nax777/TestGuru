Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                                   controllers: { sessions: 'user/sessions' }
  root 'tests#index'

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: %i[index show destroy]
    resources :badges
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :feedbacks, only: %i[new create]
  resources :badges, only: :index
end
