class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @speech = Speech.find params[:speech_id]
    @comment = @speech.comments.build(create_params)
    @comment.user = current_user
    @comment.save!
    redirect_to @speech
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy!
    redirect_to @comment.speech
  end

  private

  def create_params
    params.require(:comment).permit(:body)
  end
end
