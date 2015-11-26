class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @speech = Speech.find params[:speech_id]
    redirect_to @speech
  end

  def show
    @speech = Speech.find params[:speech_id]
    redirect_to @speech
  end

  def create
    @speech = Speech.find params[:speech_id]
    @like = @speech.likes.find_by(user: current_user) || @speech.likes.build(user: current_user)
    @speech.like_count = @speech.likes.size
    @speech.save!

    redirect_to @speech
  end

  def destroy
    @speech = Speech.find params[:speech_id]
    @like = @speech.likes.find_by(user: current_user)
    @speech.likes.destroy(@like) if @like.present?
    @speech.like_count = @speech.likes.size
    @speech.save!

    redirect_to @speech
  end
end
