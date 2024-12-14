class UserController < ApplicationController
  def index
    @list_of_users = User.all.order(:created_at)

    render({ :template => "user_templates/index"})
  end

  def details
    @user_id = params.fetch("user_id")
    user = User.where({ :id => @user_id })
    @the_user = user.at(0)

    @matching_directories = Directory.where({ :user_id => @user_id })

    #@the_board = matching_boards.at(0)

    #@matching_posts = Post.where({ :board_id => @the_board.id })

    render({ :template => "user_templates/details"})
  end
end
