class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @yogaclasses = Yogaclass.last(3).reverse
    @user = current_user
  end
end
