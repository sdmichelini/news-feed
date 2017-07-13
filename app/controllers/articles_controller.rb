class ArticlesController < ApplicationController
    # Find the article before we respond
    before_action :set_article, only: [:show, :update, :destroy]

    def index
        @articles = Article.all
        json_response(@articles)
    end

    def create
        @article = Article.create!(article_params)
        json_response(@article, :created)
    end

    def show
        json_response(@article)
    end

    def update
        @article.update(article_params)
        head :no_content
    end

    def destroy
        @article.destroy
        head :no_content
    end

    private

    def article_params
        # whitelist params
        params.permit(:title, :shared_by, :url)
    end

    def set_article
        @article = Article.find(params[:id])
    end
end
