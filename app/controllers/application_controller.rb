class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :queryArticles

  def queryArticles
    @key_word = params[:key_word]
    if (@key_word)
      @articles  = Article.where("text like ? or title like ?", "%" + params[:key_word] + "%", "%" + params[:key_word] + "%").order(updated_at: :desc).paginate(:page => params[:page], :per_page => 5)
      p @articles
    else
      @articles = Article.paginate(:page => params[:page], :per_page => 5).order(updated_at: :desc)
    end
  end

end
