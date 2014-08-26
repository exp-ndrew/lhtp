Rails.application.routes.draw do
  match('', {:via => :get, :to => 'lesson#index'})
  match('lessons/', {:via => :get, :to => 'lesson#index'})
  match('lessons/new', {:via => :get, :to => 'lesson#new'})
  match('lessons', {:via => :post, :to => 'lesson#create'})
  match('lessons/:id', {:via => :get, :to => 'lesson#show'})
  match('lessons/:id', {:via => :delete, :to => 'lesson#delete'})
  match('lessons/:id', {:via => [:put, :patch], :to => 'lesson#update'})
  match('lessons/:id/edit', {:via => :get, :to => 'lesson#edit'})

  match('lessons/:id/next', {:via => :get, :to => 'lesson#next'})
  match('lessons/:id/previous', {:via => :get, :to => 'lesson#previous'})

  match('sections/', {:via => :get, :to => 'lesson#index'})
  match('sections/new', {:via => :get, :to => 'section#new'})
  match('sections', {:via => :post, :to => 'section#create'})
  match('sections/:id/edit', {:via => :get, :to => 'section#edit'})
  match('sections/:id', {:via => [:put, :patch], :to => 'section#update'})
end
