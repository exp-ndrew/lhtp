Rails.application.routes.draw do
  match('lesson/', {:via => :get, :to => 'lesson#index'})
end
