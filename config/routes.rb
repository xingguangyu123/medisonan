Rails.application.routes.draw do
  resources :question_libraries
  resources :questions, defaults: { format: 'js' }
  resources :surveys
  resources :patients
  resources :dummy_surveys
  resources :sub_surveys
  resources :answers

  get 'home/index'
  get 'home/line_chart'
  get 'home/bar_chart'
  get 'home/horizontal_bar_chart'
  get 'home/pie_chart'

  get :question_list, controller: :questions
  get :question_library_list, controller: :question_libraries
  get :new_multiple, controller: :question_libraries
  get :show_list_for_survey, controller: :question_libraries
  get :choose_question, controller: :question_libraries

  get :new_answer, controller: :sub_surveys
  post :create_answers, controller: :sub_surveys


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
end
