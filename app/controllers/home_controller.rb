class HomeController < ApplicationController
  def index
    #@list_of_users = User.all.order(:created_at)

    render({ :template => "user_templates/index"})
  end
end
