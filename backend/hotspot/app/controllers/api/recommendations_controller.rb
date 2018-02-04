class Api::RecommendationsController < ApplicationController


  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.sender_id = current_user.id
    if @recommendation.save
      render :show
    else
      render json: @recommendation.errors.full_messages, status: 422
    end
  end

  def update
    @recommendation = current_user.sent_recommendations.find(params[:id])
    if @recommendation
      if @recommendation.update_attributes(recommendation_params)
        render :show
      else
        render json: @recommendation.errors.full_messages, status: 422
      end
    else
      render json: ['Could not find recommendation.'], status: 404
    end
  end

  def destroy
    @recommendation = current_user.sent_recommendations.find(params[:id])
    if @recommendation
      @recommendation.delete
      render :show
    else
      render json: ['Could not find recommendation.'], status: 404
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(
      :recipient_id,
      :spot_id,
      :content
    )
  end

end
