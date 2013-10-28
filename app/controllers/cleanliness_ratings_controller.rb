class CleanlinessRatingsController < ApplicationController
  def new
    @cleanlinessrating = CleanlinessRating.new
    @restroom = Restroom.find(params[:restroom_id])
  end

  def create
    @restroom = Restroom.find(params[:restroom_id])
    @cleanlinessrating = @restroom.cleanliness_ratings.new(params[:cleanliness_rating])

    respond_to do |format|
      if @cleanlinessrating.save
        format.html { redirect_to @restroom, notice: 'Cleanliness rating was successfully added.' }
        format.json { render json: @restroom, status: :created, location: @restroom }
      else
        format.html { render action: "new" }
        format.json { render json: @restroom.errors, status: :unprocessable_entity }
      end
    end
  end
end
