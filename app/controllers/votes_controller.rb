class VotesController < ApplicationController
  before_action :authenticate_user!

  def new
    @issue = Issue.find params[:issue_id]
    @vote = @issue.votes.by_user(current_user) || @issue.votes.build
  end

  def create
    @issue = Issue.find params[:issue_id]
    @vote = @issue.votes.build(create_params)
    @vote.user = current_user
    @issue.save!
    redirect_to issue_speeches_path(issue_id: @issue, position: @vote.position)
  end

  def update
    @vote = Vote.find params[:id]
    @vote.update!(update_params)
    redirect_to issue_speeches_path(issue_id: @vote.issue, position: @vote.position)
  end

  private

  def create_params
    params.require(:vote).permit(:position)
  end

  def update_params
    params.require(:vote).permit(:position)
  end
end
