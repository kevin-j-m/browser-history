class Queries::CommentsController < ApplicationController
  include ActionView::RecordIdentifier

  def create
    @commentable = Query.find(params[:query_id])
    @comment = @commentable.comments.new(comment_params)

    respond_to do |format|
    if @comment.save
      redirect_to @commentable
    else
      puts "bad"
      puts "#{dom_id(@comment)}"
      format.turbo_stream { render turbo_stream.replace(dom_id(@comment), partial: "comments/form", locals: { comment: @comment, commentable: @commentable }) }
      format.html { redirect_to @commentable }
    end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
