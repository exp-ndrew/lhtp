Rails.application.routes.draw do
  match('', {:via => :get, :to => 'lesson#index'})
  match('lessons/', {:via => :get, :to => 'lesson#index'})
  match('lessons/new', {:via => :get, :to => 'lesson#new'})
  match('lessons', {:via => :post, :to => 'lesson#create'})
  match('lessons/:id', {:via => :get, :to => 'lesson#show'})
  match('lessons/:id', {:via => :delete, :to => 'lesson#delete'})
  match('lessons/:id', {:via => [:put, :patch], :to => 'lesson#update'})
  match('lessons/:id/edit', {:via => :get, :to => 'lesson#edit'})
end
