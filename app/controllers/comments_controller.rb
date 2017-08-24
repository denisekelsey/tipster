class CommentsController < ApplicationController
  before_action :authenticate_user!


  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.create(comment_params.merge(user: current_user))
    
    if @comment.invalid?
      flash[:error] = '<strong>Cannot save blank comment.</strong> &nbsp;&nbsp;Please try again.'
    end
    redirect_to place_path(@place)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end

end

