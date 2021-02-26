class ArticlesController < ApplicationController
  def index
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to article_path(@article)
  end

  def edit
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image)
  end

end
