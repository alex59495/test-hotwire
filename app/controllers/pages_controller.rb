class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :skip_authorization

  def home
  end
end
