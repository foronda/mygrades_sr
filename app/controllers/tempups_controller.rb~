class TempupsController < ApplicationController
  # GET /tempups
  # GET /tempups.json
  def index
    @tempups = Tempup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tempups }
    end
  end

  # GET /tempups/1
  # GET /tempups/1.json
  def show
    @tempup = Tempup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tempup }
    end
  end

  # GET /tempups/new
  # GET /tempups/new.json
  def new
    @tempup = Tempup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tempup }
    end
  end

  # GET /tempups/1/edit
  def edit
    @tempup = Tempup.find(params[:id])
  end

  # POST /tempups
  # POST /tempups.json
  def create
    @tempup = Tempup.new(params[:tempup])

    respond_to do |format|
      if @tempup.save
        format.html { redirect_to @tempup, notice: 'Tempup was successfully created.' }
        format.json { render json: @tempup, status: :created, location: @tempup }
      else
        format.html { render action: "new" }
        format.json { render json: @tempup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tempups/1
  # PUT /tempups/1.json
  def update
    @tempup = Tempup.find(params[:id])

    respond_to do |format|
      if @tempup.update_attributes(params[:tempup])
        format.html { redirect_to @tempup, notice: 'Tempup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tempup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tempups/1
  # DELETE /tempups/1.json
  def destroy
    @tempup = Tempup.find(params[:id])
    @tempup.destroy

    respond_to do |format|
      format.html { redirect_to tempups_url }
      format.json { head :no_content }
    end
  end
end
