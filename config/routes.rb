Rails.application.routes.draw do
  root to: 'home#index'

  POST "/links" => 'links#create'
end
