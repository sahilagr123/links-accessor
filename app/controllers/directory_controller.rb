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
    
    @the_directory = Directory.find_by(id: @dir_id)
    if @the_directory.nil?
      redirect_to("/directory", { :alert => "Directory not found." }) and return
    end
    
    @the_user = User.find_by(id: @the_directory.user_id)
  
    # Get all Dirtolink records for this directory
    dirtolinks = Dirtolink.where(dir_id: @dir_id)
  
    # Map each Dirtolink to its associated Link
    @sites_lst = dirtolinks.map do |dirtolink|
      Link.find_by(id: dirtolink.link_id)
    end.compact # remove any nil entries if Link is not found
  
    render(template: "directory_templates/details")
  end
end
