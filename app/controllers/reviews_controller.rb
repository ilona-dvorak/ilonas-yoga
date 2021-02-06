class ReviewsController < ApplicationController
  def create
    @yogaclass = Yogaclass.find(params[:yogaclass_id])
    authorize @review
    @review = Review.new(review_params)
    @review.yogaclass = @yogaclass
    if @review.save
      redirect_to yogaclass_path(@yogaclass, anchor: "review-#{@review.id}")
    else
      render 'yogaclasses/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
