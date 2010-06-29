ActionController::Routing::Routes.draw do |map|
  map.resources :case_answers

  map.resources :resources

  map.resources :cases

  map.resources :survey_answers


  map.root :controller => 'application', :action => 'welcome'

  map.resources :surveys do |survey|
    survey.resources :user_answers
    survey.resources :questions
  end


  map.resources :user_answers, :has_one => :survey
  map.resources :case_answers, :has_one => :survey

  map.resources :questions, :has_many => :answers

  map.resources :answers

  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  map.new_survey_user_case_answer 'cases/:case_id/surveys/:survey_id/user_answers/new', :controller => 'user_answers', :action => 'new'
  map.edit_survey_user_case_answer 'cases/:case_id/surveys/:survey_id/user_answers/edit', :controller => 'user_answers', :action => 'edit'
  map.survey_user_case_answers 'cases/:case_id/surveys/:survey_id/user_answers/create', :controller => 'user_answers', :action => 'create'

  map.new_survey_case_answer 'cases/:case_id/surveys/:survey_id/case_answers/new', :controller => 'case_answers', :action => 'new'
  map.edit_survey_case_answer 'cases/:case_id/surveys/:survey_id/case_answers/edit', :controller => 'case_answers', :action => 'edit'
  map.survey_case_answers 'cases/:case_id/surveys/:survey_id/case_answers/create', :controller => 'case_answers', :action => 'create'
  map.survey_results 'surveys/:user_id/results', :controller => 'user_answers', :action => 'results'
  map.user_promote '/users/promote/:id', :controller => 'users', :action => 'promote'
  map.root :controller => "user_sessions", :action => "new"
end
