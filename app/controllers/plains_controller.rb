class PlainsController < ApplicationController
  before_action :set_plain, only: [:show, :edit, :update, :destroy]

  # GET /plains
  # GET /plains.json
  def index
    @plains = Plain.all
  end

  # GET /plains/1
  # GET /plains/1.json
  def show
  end

  # GET /plains/new
  def new
    @plain = Plain.new
  end

  # GET /plains/1/edit
  def edit
  end

  # POST /plains
  # POST /plains.json
  def create
    @plain = Plain.new(plain_params)

    respond_to do |format|
      if @plain.save
        format.html { redirect_to @plain, notice: 'Plain was successfully created.' }
        format.json { render :show, status: :created, location: @plain }
      else
        format.html { render :new }
        format.json { render json: @plain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plains/1
  # PATCH/PUT /plains/1.json
  def update
    respond_to do |format|
      if @plain.update(plain_params)
        format.html { redirect_to @plain, notice: 'Plain was successfully updated.' }
        format.json { render :show, status: :ok, location: @plain }
      else
        format.html { render :edit }
        format.json { render json: @plain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plains/1
  # DELETE /plains/1.json
  def destroy
    @plain.destroy
    respond_to do |format|
      format.html { redirect_to plains_url, notice: 'Plain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plain
      @plain = Plain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plain_params
      params.require(:plain).permit(:boke, :tsukkomi)
    end
end
