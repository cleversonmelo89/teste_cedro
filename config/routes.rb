Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :restaurants
      resources :plates
      match 'restaurants/:id', to: 'restaurants#destroy', as: :restaurants_delete_options, via: :options
      match :restaurants, to: 'restaurants#create', as: :restaurants_create_options, via: :options
    end
  end
end
