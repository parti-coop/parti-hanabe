class IssuesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @issues = Issue.order("id desc")
  end

  def show
    @issue = Issue.find params[:id]
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(create_params)
    @issue.user = current_user
    @issue.save!
    redirect_to @issue
  end

  def edit
    @issue = Issue.find params[:id]
  end

  def update
    @issue = Issue.find params[:id]
    @issue.update(update_params)
    redirect_to @issue
  end

  def destroy
    @issue = Issue.find params[:id]
    @issue.destroy
    redirect_to @issue
  end

  private

  def create_params
    params.require(:issue).permit(:title)
  end

  def update_params
    params.require(:issue).permit(:title)
  end
end
