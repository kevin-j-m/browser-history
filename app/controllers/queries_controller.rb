class QueriesController < ApplicationController
  def index
    @queries = Query
      .includes(comments: :rich_text_body)
      .all
      .order(searched_at: :desc)
  end

  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)

    if @query.save
      redirect_to @query
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @query = Query.find(params[:id])
  end

  private

  def query_params
    params.require(:query).permit(:search_term)
  end
end
