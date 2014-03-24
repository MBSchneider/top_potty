class CleanlinessRatingsController < ApplicationController
  before_filter :authenticate_user!, except: [:new, :create, :index, :show]
  after_filter :verify_authorized, except: [:index, :show]

  def new
    @cleanlinessrating = CleanlinessRating.new
    @note = Note.new
    @restroom = Restroom.find(params[:restroom_id])
  end

  def create
    puts '**************** CREATE CleanlinessRating'
    @restroom = Restroom.find(params[:restroom_id])
    puts 'CREATE ' + @restroom.cleanaverage.to_s if @restroom.cleanaverage
    @cleanlinessrating = @restroom.cleanliness_ratings.new(params[:cleanliness_rating])
    @note = @restroom.notes.new(params[:note])
    # @note.user_id = current_user.id ## users not authenticated

    respond_to do |format|
      if @cleanlinessrating.save
        @restroom = Restroom.find(params[:restroom_id])
        @restroom.update_attributes(cleanaverage: get_cleanliness_average(@restroom))
        puts 'CREATE 2 ' + @restroom.cleanaverage.to_s
        puts @note.comment
        @note.save unless @note.comment == ''
        puts @note
        format.html { redirect_to @restroom, notice: 'Cleanliness rating was successfully added.' }
        format.json { render json: @restroom, status: :created, location: @restroom }
      else
        format.html { render action: 'new' }
        format.json { render json: @restroom.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def get_cleanliness_average(restroom)
    sum = 0
    restroom.cleanliness_ratings.each do |c|
      sum += c.cleanlinessrating
    end
    sum / restroom.cleanliness_ratings.size
  end
end
