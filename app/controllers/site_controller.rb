class SiteController < ApplicationController

  def add_old_site #add a pre-existing site to directory
    connection = Dirtolink.new
    connection.dir_id = params.fetch("query_dir_id")
    connection.link_id = params.fetch("query_link_id")

    matches = Dirtolink.where({ :dir_id => connection.dir_id, :link_id => connection.link_id })

    if matches.present?
      redirect_to("/directory/#{connection.dir_id}", { :notice => "Duplicate item entered"})
    elsif connection.valid?
      connection.save
      redirect_to("/directory/#{connection.dir_id}", { :notice => "Site created successfully." })
    else
      redirect_to("/", { :alert => the_directory.errors.full_messages.to_sentence })
    end
  end


  def create_form #go to the create form page
    @link = params.fetch("query_link")
    @dir_id = params.fetch("query_dir_id")

    #find all matching links in Link db
    @matching_links = Link.where({ :link => @link })
    #@matching_links = matching_links.at(0)

    render( :template => "sites_templates/create_form")
  end  

  def create
    # Create a new site
    the_site = Link.new
    the_site.name = params.fetch("query_name")
    the_site.link = params.fetch("query_link")
    the_site.description = params.fetch("query_description")
  
    # Validate and save the new site first
    if the_site.valid?
      the_site.save
  
      # Now that the_site is saved, it has an id
      connection = Dirtolink.new
      connection.dir_id = params.fetch("query_dir")
      connection.link_id = the_site.id
  
      # Save the connection
      connection.save
  
      redirect_to("/directory/#{connection.dir_id}", { :notice => "Site created successfully." })
    else
      # Use the_site for error messages, since the_directory is not defined
      redirect_to("/", { :alert => the_site.errors.full_messages.to_sentence })
    end
  end

  def delete
    link_id = params.fetch("query_link_id")
    dir_id = params.fetch("query_dir_id")
    matches = Dirtolink.where({ :link_id => link_id })
    match = matches.at(0)

    if match.present?
      match.destroy #destroy the connection between directory and link
      redirect_to("/directory/#{dir_id}", { :notice => "Site deleted from directory" })
    else
      redirect_to("/", { :alert => "Error - link could not be deleted" })
    end
  end
end
