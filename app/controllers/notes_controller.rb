class NotesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  after_filter :verify_authorized, except: [:index, :show]

  def new
    @note = Note.new
    @restroom = Restroom.find(params[:restroom_id])
  end

  def create
    @restroom = Restroom.find(params[:restroom_id])
    @note = @restroom.notes.new(params[:note])
    @note.user = current_user

    respond_to do |format|
      if @note.save
        format.html { redirect_to @restroom, notice: 'Note was successfully added.' }
        format.json { render json: @restroom, status: :created, location: @restroom }
      else
        format.html { render action: 'new' }
        format.json { render json: @restroom.errors, status: :unprocessable_entity }
      end
    end
  end
end
