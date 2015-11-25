class SpeechesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @issue = Issue.find params[:issue_id]
    @speeches = @issue.speeches
    position = params[:position]
    @speeches = @speeches.by_position(position) if position.present?
  end

  def show
    @speech = Speech.find params[:id]
  end

  def new
    @issue = Issue.find params[:issue_id]
    @speech = @issue.speeches.build
  end

  def create
    @issue = Issue.find params[:issue_id]
    @speech = @issue.speeches.build(create_params)
    @speech.user = current_user
    @issue.save!
    redirect_to @speech
  end

  def edit
    @speech = Speech.find params[:id]
  end

  def update
    @speech = Speech.find params[:id]
    @speech.update!(update_params)
    redirect_to @speech
  end

  def destroy
    @speech = Speech.find params[:id]
    @speech.destroy
    redirect_to issue_speeches_path(issue_id: @speech.issue, position: @speech.position)
  end

  private

  def create_params
    params.require(:speech).permit(:title, :body, :position)
  end

  def update_params
    params.require(:speech).permit(:title, :body, :position)
  end
end
