class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, only: :findme

  def home
  end

  def findpost_help
  end

  def wallpost_help
  end

  def about
  end

  def contact
  end
  
end
