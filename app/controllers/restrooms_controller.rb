class RestroomsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  after_filter :verify_authorized, except: [:index, :show]

  # GET /restrooms
  # GET /restrooms.json
  def index
    if params[:address].present?
      @q = Restroom.near(params[:address], 60, order: :distance).search(params[:q])
      @restrooms = @q.result(distinct: true).page(params[:page]).per(5)
      @search_coordinates = Geocoder.coordinates(params[:address])
      @is_search = true
    else
      @q = Restroom.near(request.remote_ip, 60, order: :distance).search(params[:q])
      @restrooms = @q.result(distinct: true).page(params[:page]).per(5)
      @search_coordinates = Geocoder.coordinates(request.remote_ip)
      @is_search = false
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
    @q = Restroom.search(params[:q])

    if params[:address].present?
      @q = Restroom.near(params[:address], 60, order: :distance).search(params[:q])
      @restrooms = @q.result(distinct: true).page(params[:page]).per(5)
      @search_coordinates = Geocoder.coordinates(params[:address])
      @is_search = true
    end

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
    @this_address = @this_location.formatted_address.split(',')
    @restroom.addressone = @this_address[0]
    @restroom.addresstwo = @this_address[1] + @this_address[2] if @this_address[1] && @this_address[2]
    @restroom.update_cleanaverage

    respond_to do |format|
      if @restroom.save
        format.html { redirect_to @restroom, notice: 'Restroom was successfully created.' }
        format.json { render json: @restroom, status: :created, location: @restroom }
      else
        format.html { render action: 'new' }
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
        format.html { render action: 'edit' }
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
