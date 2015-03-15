class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])

    requestParams = comment_params()
    requestParams[:commenter] = current_user.email

    @comment = @article.comments.create(requestParams)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
