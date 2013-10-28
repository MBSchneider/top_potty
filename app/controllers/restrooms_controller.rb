class RestroomsController < ApplicationController
  # GET /restrooms
  # GET /restrooms.json
  def index
    @restrooms = Restroom.all
    @cleanlinessratings = CleanlinessRating.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restrooms }
    end
  end

  # GET /restrooms/1
  # GET /restrooms/1.json
  def show
    @restroom = Restroom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restroom }
    end
  end

  # GET /restrooms/new
  # GET /restrooms/new.json
  def new
    @restroom = Restroom.new
    @restroom.cleanliness_ratings.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restroom }
    end
  end

  # GET /restrooms/1/edit
  def edit
    @restroom = Restroom.find(params[:id])
  end

  # POST /restrooms
  # POST /restrooms.json
  def create
    @restroom = Restroom.new(params[:restroom])

    respond_to do |format|
      if @restroom.save
        format.html { redirect_to @restroom, notice: 'Restroom was successfully created.' }
        format.json { render json: @restroom, status: :created, location: @restroom }
      else
        format.html { render action: "new" }
        format.json { render json: @restroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restrooms/1
  # PUT /restrooms/1.json
  def update
    @restroom = Restroom.find(params[:id])

    respond_to do |format|
      if @restroom.update_attributes(params[:restroom])
        format.html { redirect_to @restroom, notice: 'Restroom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restrooms/1
  # DELETE /restrooms/1.json
  def destroy
    @restroom = Restroom.find(params[:id])
    @restroom.destroy

    respond_to do |format|
      format.html { redirect_to restrooms_url }
      format.json { head :no_content }
    end
  end
end
