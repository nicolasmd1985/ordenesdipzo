class ArticlesController < ApplicationController
  #get /articles
  def index
    #todos los registros
    @articles = Article.all
  end
  #get articles id
  def show
    #encuentra por id
    @article = Article.find(params[:id])
    #Article.where("body LIKE ?", "%hola%")
  end

  def new
    @article = Article.new
  end
  #post article
  def create
    @article = Article.new(title: params[:article][:title],
                            body: params[:article][:body])
    # @article.valid?
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def update
    #@article.update
  end

  #delete
  def destroy
    @article = Article.find(params[:id])
    @article.destroy #elima el objeto en la base de datos
    redirect_to articles_path
  end

  private

  def article_params
    #
  end
end
