class HomeController < ApplicationController
  include HomeHelper

  def index
    @daily_quote = INSPIRATION.sample
  end
end
