class TipocomprobantesController < ApplicationController
  before_action :set_tipocomprobante, only: [:show, :update, :destroy]

  # GET /tipocomprobantes
  def index
    @tipocomprobantes = Tipocomprobante.all

    render json: @tipocomprobantes
  end

  # GET /tipocomprobantes/1
  def show
    render json: @tipocomprobante
  end

  # POST /tipocomprobantes
  def create
    @tipocomprobante = Tipocomprobante.new(tipocomprobante_params)

    if @tipocomprobante.save
      render json: @tipocomprobante, status: :created, location: @tipocomprobante
    else
      render json: @tipocomprobante.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipocomprobantes/1
  def update
    if @tipocomprobante.update(tipocomprobante_params)
      render json: @tipocomprobante
    else
      render json: @tipocomprobante.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipocomprobantes/1
  def destroy
    @tipocomprobante.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipocomprobante
      @tipocomprobante = Tipocomprobante.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipocomprobante_params
      params.require(:tipocomprobante).permit(:descripcion, :abreviacion, :activo)
    end
end
