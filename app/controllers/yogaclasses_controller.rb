class YogaclassesController < ApplicationController

  def index

  end

# get yogaclass/1
# get jogaclass/1.json
  def show
  @yogaclass = Yogaclass.find(params[:id])
  # @yogaclasses = @Yogaclass.yogaclasses
  end

end
