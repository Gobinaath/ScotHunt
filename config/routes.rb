Rails.application.routes.draw do

  get 'moderator/moderator' => 'moderator#moderator'
  get 'recruiter/shortlist' => 'recruiter#shortlist'

  get 'job_listing/job_listing' => 'job_listing#job_listing'
  post 'job_listing/job_listing' => 'job_listing#search'
get 'job_listing/search' => 'job_listing#search'
  get 'recruiter/search' => 'recruiter#search'
  get 'recruiterjobpost/recruiterjobpost'
  get 'applyjob/apply' => 'applyjob#apply'
  get 'applyjob/save' => 'applyjob#save'
  get 'recruiter/applicantdetails' => 'recruiter#applicantdetails'
 get 'job_seeker/applieddetails' => 'job_seeker#applieddetails'
get 'recruiter/jobdetails' => 'job_seeker#jobdetails'
resources :sessions, only:[:new, :create, :destroy]
  get 'signup', to: 'user#new', as: 'signup'
  get 'user/create' => 'user#create'
  post 'signup', to: 'user#create', as: 'reg'
  get 'session/new', to: 'session#new', as: 'login'
  post 'session/new' => 'session#create'
  get 'session/create' => 'session#create'
  get 'logout', to: 'session#destroy', as: 'logout' 
  get 'password_resets/new' => 'password_resets#new'
  get 'password_resets/create' => 'password_resets#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get 'job_seeker/editpersonaldetails' => 'job_seeker#editpersonaldetails'
 get 'job_seeker/editexperiancedetails' => 'job_seeker#editexperiancedetails'
    get 'job_seeker/editeducationdetails' => 'job_seeker#editeducationdetails'
    get 'job_seeker/edit'=> 'job_seeker#edit'
    post 'job_seeker/edit'=> 'job_seeker#update'
 get 'job_seeker/new' => 'job_seeker#new'
 post 'job_seeker/new' => 'job_seeker#create'
 get 'job_seeker/studentprofile' => 'job_seeker#studentprofile'
 #post 'job_seeker/create' => 'job_seeker#studentprofile'

 get 'job_seeker/summa' => 'job_seeker#summa'
get 'recruiter/recruiterprofilecreation' => 'recruiter#recruiterprofilecreation'
post 'recruiter/recruiterprofilecreation' => 'recruiter#create'
 get 'recruiter/new' => 'recruiter#new'
 post 'recruiter/new' => 'recruiter#create'
 get 'recruiter/recruiterprofile' => 'recruiter#recruiterprofile'
   get 'recruiter/edit'=> 'recruiter#edit'
    post 'recruiter/update'=> 'recruiter#update'

 get 'job_listing/job_listing.html.erb' => 'job_listing#job_listing.html.erb'
 get 'recruiter/summa' => 'recruiter#summa'
  get 'auth/:provider/callback', to: "socialmedia#create"
  get  'auth/:provider/destroy',  to: "home#destroy"

  get 'recruiterjobpost/recruiterjobpost' => 'recruiterjobpost#recruiterjobpost'
  post 'recruiterjobpost/recruiterjobpost' => 'recruiterjobpost/create'
  post 'recruiterjobpost/create' => 'recruiterjobpost/create'

  get 'recruiterjobpost/summa' => 'recruiterjobpost#summa'

resources :user
  resources :password_resets
  post 'password_resets/:id/edit' => 'password_resetss#update'
  post 'password_resets/new' => 'password_resets#create'

get '/:token/confirm_email/', :to => "user#confirm_email", as: 'confirm_email'

  get 'home/index' 

  get 'home/blog' => 'home#blog'

  root 'home#index'

end
