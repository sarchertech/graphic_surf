class PagesController < ApplicationController
  def index
    @projects = Project.recent
  end
end
