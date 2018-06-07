class ArticlesController < ApplicationController
  # before_action :validate_user, except: [:show,:index]
  #get /articles
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_article, except: [:index, :new, :create]


  def index
    #todos los registros
    @articles = Article.all
  end
  #get articles id
  def show
    #encuentra por id
    # @article = Article.find(params[:id])
    #Article.where("body LIKE ?", "%hola%")
    @article.update_visits_count
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end
  #post article
  def create
    #@article = Article.new(title: params[:article][:title],
    #                        body: params[:article][:body])
    # @article.valid?
    ##strong params
    # @article = Article.new(article_params
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    #@article.update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  #delete
  def destroy
    # @article = Article.find(params[:id])
    @article.destroy #elimina el objeto en la base de datos
    redirect_to articles_path
  end
  #
  # def validate_user
  #   redirect_to new_user_session_path, notice: "Necesitas iniciar sesion"
  #   #code
  # end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:body,:cover)
  end
end
