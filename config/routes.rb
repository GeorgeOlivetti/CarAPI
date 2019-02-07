Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'car#index'

get "printAll", to: "car#printAll", as: 'printAll'

get "createCar", to: "car#create", as: 'createCar'

get "deleteCar", to: "car#delete", as: 'deleteCar'

end
