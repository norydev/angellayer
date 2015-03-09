class CommentsController < ApplicationController

  before_action :find_evaluation
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments/new
  def new
  end

  # GET /comments/1/edit
  def edit
  end

  def show
  end

  # POST /comments
  def create
    @comment = @evaluation.comments.build(comment_params)
    @comment.founder = current_founder
    if @comment.save
      respond_to do |format|
        format.html { redirect_to investors_profile_path(@evaluation.investor_profile), notice: 'Your comment was successfully created.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
    end
  end




  # PATCH/PUT /comments/1
  def update
    @comment.founder = current_founder
    if @comment.update(comment_params)
      redirect_to investors_profile_path(@evaluation.investor_profile), notice: 'Your comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to evaluation_comments_path(@evaluation), notice: 'Your comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @evaluation.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content, :evaluation_id, :founder_id)
    end

    def find_evaluation
      @evaluation = Evaluation.find(params[:evaluation_id])
    end
end


