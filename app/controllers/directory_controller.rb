class DirectoryController < ApplicationController

  def create
    the_directory = Directory.new
    the_directory.name = params.fetch("query_name")

    the_directory.user_id = current_user.id

    if the_directory.valid?
      the_directory.save
      redirect_to("/directory/#{the_directory.id}", { :notice => "Directory created successfully." })
    else
      redirect_to("/directory", { :alert => the_directory.errors.full_messages.to_sentence })
    end
  end

  def details
    @dir_id = params.fetch("dir_id")
    dir = Directory.where({ :id => @dir_id })
    @the_directory = dir.at(0)

    the_user = User.where({ :id => @the_directory.user_id })
    @the_user = the_user.at(0)

    render( :template => "directory_templates/details")
  end 

end
