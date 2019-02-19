Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'car#index'

get "printAll", to: "car#printAll", as: 'printAll'

get "createCar", to: "car#create", as: 'createCar'

get "deleteCar", to: "car#delete", as: 'deleteCar'

get "editCar", to: "car#editCar", as: "editCar"

get "addRandomCar", to: "car#addRandomCar", as: "addRandomCar"

get "showCar", to: "car#showCar", as: "showCar"

get "token/new", to: "token#new", as: "tokens"

post "token/new", to: "token#show", as: "tokenShow"

get "token/list", to: "token#list", as: "list"

get "error", to: "car#error", as: "error"

get "logs", to: "log#show", as: "showLogs"

get "helper", to: "car#helper", as: "helper"

get "query", to: "car#query", as: "query"

end
