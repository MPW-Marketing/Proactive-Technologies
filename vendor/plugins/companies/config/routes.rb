ActionController::Routing::Routes.draw do |map|
  map.resources :companies

  map.namespace(:admin) do |admin|
    admin.resources :companies
  end
end
