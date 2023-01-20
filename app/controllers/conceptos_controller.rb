class ConceptosController < ApplicationController
  before_action :set_concepto, only: [:show, :update, :destroy]

  # GET /conceptos
  def index
    @conceptos = Concepto.all

    render json: @conceptos
  end

  # GET /conceptos/1
  def show
    render json: @concepto
  end

  # POST /conceptos
  def create
    @concepto = Concepto.new(concepto_params)

    if @concepto.save
      render json: @concepto, status: :created, location: @concepto
    else
      render json: @concepto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conceptos/1
  def update
    if @concepto.update(concepto_params)
      render json: @concepto
    else
      render json: @concepto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conceptos/1
  def destroy
    @concepto.destroy
  end

  def getconceptobytiporegistro
    @conceptos = Concepto.where(tiporegistro_id:params[:tiporegistro_id])

    render json: @conceptos
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concepto
      @concepto = Concepto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def concepto_params
      params.require(:concepto).permit(:descripcion, :activo, :tiporegistro_id)
    end
end
