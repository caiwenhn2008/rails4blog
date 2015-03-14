class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :queryArticles

  def queryArticles
    @articles = Article.paginate(:page => params[:page], :per_page => 10).order(updated_at: :desc)
  end

end
