##
#Defines routes for all static pages in the application.
class StaticPagesController < ApplicationController
  ##
  #Renders the home page.
  def home
  	render layout: "static_home"
  end

  ##
  #Renders the developer home page.
  def developer_home
  	render layout: "developer_home_template"
  end

  ##
  #Renders the contribute page.
  def contribute
  	render layout: "developer_home_template"
  end
end
