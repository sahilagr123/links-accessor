class SiteController < ApplicationController

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
end
