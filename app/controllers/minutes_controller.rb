class MinutesController < ApplicationController
  before_filter :authenticate_user!
  # GET /minutes
  # GET /minutes.json
  def index
    @minutes = Minute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @minutes }
    end
  end

  # GET /minutes/1
  # GET /minutes/1.json
  def show
    @minute = Minute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @minute }
    end
  end

  # GET /minutes/new
  # GET /minutes/new.json
  def new
    @minute = Minute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @minute }
    end
  end

  # GET /minutes/1/edit
  def edit
    @minute = Minute.find(params[:id])
  end

  # POST /minutes
  # POST /minutes.json
  def create
    @minute = Minute.new(params[:minute])

    respond_to do |format|
      if @minute.save
        format.html { redirect_to @minute, notice: 'Minute was successfully created.' }
        format.json { render json: @minute, status: :created, location: @minute }
      else
        format.html { render action: "new" }
        format.json { render json: @minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /minutes/1
  # PUT /minutes/1.json
  def update
    @minute = Minute.find(params[:id])

    respond_to do |format|
      if @minute.update_attributes(params[:minute])
        format.html { redirect_to @minute, notice: 'Minute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minutes/1
  # DELETE /minutes/1.json
  def destroy
    @minute = Minute.find(params[:id])
    @minute.destroy

    respond_to do |format|
      format.html { redirect_to minutes_url }
      format.json { head :no_content }
    end
  end
end
