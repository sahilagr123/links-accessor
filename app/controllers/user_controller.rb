class UserController < ApplicationController
  
  def show_all_links
    # Fetch all links
    list_of_sites = Link.all
  
    # Update clicked_on count for each link
    list_of_sites.each do |site|
      # Count how many Dirtolinks reference this link
      count = Dirtolink.where(link_id: site.id).count
  
      # Update the database record with the new clicked_on value
      site.update(clicked_on: count)
    end
  
    # Retrieve all sites ordered by clicked_on in descending order (highest first)
    @site_lst = Link.order(clicked_on: :desc)
  
    render(template: "user_templates/show_all")
  end
  
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
