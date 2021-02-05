class ReviewsController < ApplicationController
  def create
    @yogaclass = Yogaclass.find(params[:id])
    @review = Review.new(review_params)
    @review.yogaclass = @yogaclass
    if @review.save
      redirect_to yogaclass_path(@yogaclass)
    else
      render 'yogaclasses/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
