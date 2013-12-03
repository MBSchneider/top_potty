class RestroomsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  after_filter :verify_authorized, except: [:index, :show]

  # GET /restrooms
  # GET /restrooms.json
  def index
    if params[:search].present? && params[:malefemale].present?
      @restrooms = Restroom.near(params[:search], 60, :order => :distance).where(:malefemale => params[:malefemale]).limit(5)
      @search_coordinates = Geocoder.coordinates(params[:search])
    elsif params[:search].present?
      @restrooms = Restroom.near(params[:search], 60, :order => :distance).limit(5)
      @search_coordinates = Geocoder.coordinates(params[:search])
    else
      @restrooms = Restroom.near(request.remote_ip, 60, :order => :distance).limit(5)
      @search_coordinates = Geocoder.coordinates(request.remote_ip)
    end
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
    if params[:newrr_search].present? && Geocoder.search(params[:newrr_search])[0].data["geometry"]["location_type"] != "GEOMETRIC_CENTER"
      puts "YES"
    end

    #if params[:restroom_location].present?
    #   respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @restroom }
    # else
    #   respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @restroom }
    # end

    @restroom = Restroom.new
    authorize @restroom
    @restroom.cleanliness_ratings.build
    @restroom.notes.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restroom }
      format.js
    end
  end

  def newprelim
    @restroom = Restroom.new
    authorize @restroom
    @restroom.cleanliness_ratings.build
    #@restroom.notes.build

    respond_to do |format|
      format.js
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
    @this_location = Geocoder.search(@restroom.location)[0]
    @this_address = @this_location.formatted_address.split(",")
    @restroom.addressone = @this_address[0]
    @restroom.addresstwo = @this_address[1] + @this_address[2] if @this_address[1] && @this_address[2]
    #@note = @restroom.notes.build(params[:note])
    #@note.user_id = current_user.id

    respond_to do |format|
      if @restroom.save
        puts "SAVED"
        format.html { redirect_to @restroom, notice: 'Restroom was successfully created.' }
        format.json { render json: @restroom, status: :created, location: @restroom }
      else
        puts "NOT SAVED"
        # format.js { render action: "new" }
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
