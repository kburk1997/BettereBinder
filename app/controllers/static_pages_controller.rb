class StaticPagesController < ApplicationController
  def home
  	render layout: "static_home"
  end
end
