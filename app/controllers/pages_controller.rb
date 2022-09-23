class PagesController < ApplicationController
  def home
    @title_of_page = 'Home Page'
    @active_page = 'Home'
  end
end
