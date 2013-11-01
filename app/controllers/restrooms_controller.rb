class RestroomsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  after_filter :verify_authorized, except: [:index, :show]
  # GET /restrooms
  # GET /restrooms.json
  def index

    if params[:search].present? && params[:malefemale] == 'male'
      @restrooms = Restroom.near(params[:search], 60, :order => :distance).where(:malefemale => 'male').limit(5)
      @search_coordinates = Geocoder.coordinates(params[:search])
    elsif params[:search].present? && params[:malefemale] == 'female'
      @restrooms = Restroom.near(params[:search], 60, :order => :distance).where(:malefemale => 'female').limit(5)
      @search_coordinates = Geocoder.coordinates(params[:search])
    elsif params[:search].present?
      @restrooms = Restroom.near(params[:search], 60, :order => :distance).where(:malefemale => 'female').limit(5)
      @search_coordinates = Geocoder.coordinates(params[:search])
    else
      @restrooms = Restroom.limit(6)
      result = request.location
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js
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
    authorize @restroom
    @restroom.cleanliness_ratings.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restroom }
    end
  end

  def newprelim
    @restroom = Restroom.new
    authorize @restroom
    @restroom.cleanliness_ratings.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restroom }
    end
  end

  # GET /restrooms/1/edit
  def edit
    @restroom = Restroom.find(params[:id])
    authorize @restroom
  end

  # POST /restrooms
  # POST /restrooms.json
  def create
    @restroom = Restroom.new(params[:restroom])
    authorize @restroom
    @this_address = Geocoder.search(@restroom.location)[0].formatted_address.split(",")
    @restroom.addressone = @this_address[0]
    @restroom.addresstwo = @this_address[1] + @this_address[2]

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
    authorize @restroom

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
    authorize @restroom
    @restroom.destroy
    respond_to do |format|
      format.html { redirect_to restrooms_path, notice: 'Restroom deleted.' }
      format.json { head :no_content }
    end
  end
end
