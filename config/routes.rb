Rails.application.routes.draw do
  devise_for :users
  root to: "user#index"

  get("/users/:user_id", { :controller => "user", :action => "details"})

  get("/directory/:dir_id", { :controller => "directory", :action => "details"})

  post("/insert_directory", { :controller => "directory", :action => "create" })

  get("/insert_site_initial", { :controller => "site", :action => "create_form"})
  post("/insert_site", { :controller => "site", :action => "create"})
  post("/add_old_site", { :controller => "site", :action => "add_old_site"})
  post("/delete_from_directory", { :controller => "site", :action => "delete"})

  get("/add_site/:dir_id/:site_id", { :controller => "site", :action => "add_old_site"})
  post("/open_all", { :controller => "directory", :action => "open_all_links"})
  get "/directories/:dir_id/open_all_links", to: "directories#open_all_links", as: :open_all_links
  #get("/", { :controller => "home", :action => "index"})
  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
