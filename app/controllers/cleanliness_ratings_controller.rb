class CleanlinessRatingsController < ApplicationController
  before_filter :authenticate_user!, except: [:new, :create, :index, :show]
  after_filter :verify_authorized, except: [:index, :show]

  def new
    @cleanlinessrating = CleanlinessRating.new
    @note = Note.new
    @restroom = Restroom.find(params[:restroom_id])
  end

  def create
    @restroom = Restroom.find(params[:restroom_id])
    @cleanlinessrating = @restroom.cleanliness_ratings.new(params[:cleanliness_rating])
    @note = @restroom.notes.new(params[:note])
    # @note.user_id = current_user.id ## users not authenticated

    respond_to do |format|
      if @cleanlinessrating.save
        puts @note.comment
        if @note.comment != ""
          @note.save
        end
        puts @note
        format.html { redirect_to @restroom, notice: 'Cleanliness rating was successfully added.' }
        format.json { render json: @restroom, status: :created, location: @restroom }
      else
        format.html { render action: "new" }
        format.json { render json: @restroom.errors, status: :unprocessable_entity }
      end
    end
  end
end
