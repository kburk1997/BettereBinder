##
#Defines routes for all static pages in the application.
class StaticPagesController < ApplicationController
  ##
  #Renders the home page.
  def home
  	render layout: "static_home"
  end
end
