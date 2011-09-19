class HomeController < ApplicationController
  def index
  end

  def invalid
    render_404
  end
end
