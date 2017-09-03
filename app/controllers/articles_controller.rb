class ArticlesController < ApplicationController

  before_action :authenticate_user!

  #verify :method => :post, :only => [ :destroy, :create, :update ],
  #  :redirect_to => { :action => :index }

  def index
    render :json => Article.all
  end

  def show
    render :json => Article.find(params[:id])
  end

  def create
    article = Article.new(article_params)
    article.user = current_user
    if article.save
      render :json => article
    else
      render :json => { error: "No se pudo crear" }, :status => :bad_request
    end
  end

  def update
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:text)
  end

end
