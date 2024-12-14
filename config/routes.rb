Rails.application.routes.draw do
  devise_for :users
  root to: "user#index"

  get("/users/:user_id", { :controller => "user", :action => "details"})

  get("/directory/:dir_id", { :controller => "directory", :action => "details"})

  post("/insert_directory", { :controller => "directory", :action => "create" })
  #get("/", { :controller => "home", :action => "index"})
  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
