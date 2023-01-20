class TiporegistrosController < ApplicationController
  before_action :set_tiporegistro, only: [:show, :update, :destroy]

  # GET /tiporegistros
  def index
    @tiporegistros = Tiporegistro.all

    render json: @tiporegistros
  end

  # GET /tiporegistros/1
  def show
    render json: @tiporegistro
  end

  # POST /tiporegistros
  def create
    @tiporegistro = Tiporegistro.new(tiporegistro_params)

    if @tiporegistro.save
      render json: @tiporegistro, status: :created, location: @tiporegistro
    else
      render json: @tiporegistro.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tiporegistros/1
  def update
    if @tiporegistro.update(tiporegistro_params)
      render json: @tiporegistro
    else
      render json: @tiporegistro.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tiporegistros/1
  def destroy
    @tiporegistro.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tiporegistro
      @tiporegistro = Tiporegistro.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tiporegistro_params
      params.require(:tiporegistro).permit(:descripcion)
    end
end
