class OfficesController < ApplicationController
  before_action :authenticate_user!
  before_action :isPerfilSelecionado
  before_action :set_office, only: [:show, :edit, :update, :destroy]

  # GET /offices
  # GET /offices.json
  def index
    #@offices = Office.all
    respond_to do |format|
        format.html { }
        format.json { render json: OfficeDatatable.new(view_context,:isAdministrador => current_user.isAdministrador(session[:system_nome],session[:role]), :systemSelected => session[:system_id])}
      end
  end

  # GET /offices/1
  # GET /offices/1.json
  def show
    @items = @office.items.all
  end

  # GET /offices/new
  def new
    @office = Office.new
  end

  # GET /offices/1/edit
  def edit
  end

  # POST /offices
  # POST /offices.json
  def create
    @office = Office.new(office_params)

    respond_to do |format|
      if @office.save
        format.html { redirect_to @office, notice: 'Office was successfully created.' }
        format.json { render :show, status: :created, location: @office }
      else
        format.html { render :new }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offices/1
  # PATCH/PUT /offices/1.json
  def update
    respond_to do |format|
      if @office.update(office_params)
        format.html { redirect_to @office, notice: 'Office was successfully updated.' }
        format.json { render :show, status: :ok, location: @office }
      else
        format.html { render :edit }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offices/1
  # DELETE /offices/1.json
  def destroy
    @office.destroy
    respond_to do |format|
      format.html { redirect_to offices_url, notice: 'Office was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office
      @office = Office.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_params
      params.require(:office).permit(:system_id,:identificador, :sipro, :siged, :dataRecebimento, :ocorrencia)
    end
end
