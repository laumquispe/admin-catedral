class TipousuariosController < ApplicationController
  before_action :set_tipousuario, only: [:show, :update, :destroy]

  # GET /tipousuarios
  def index
    @tipousuarios = Tipousuario.all

    render json: @tipousuarios
  end

  # GET /tipousuarios/1
  def show
    render json: @tipousuario
  end

  # POST /tipousuarios
  def create
    @tipousuario = Tipousuario.new(tipousuario_params)

    if @tipousuario.save
      render json: @tipousuario, status: :created, location: @tipousuario
    else
      render json: @tipousuario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipousuarios/1
  def update
    if @tipousuario.update(tipousuario_params)
      render json: @tipousuario
    else
      render json: @tipousuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipousuarios/1
  def destroy
    @tipousuario.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipousuario
      @tipousuario = Tipousuario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipousuario_params
      params.require(:tipousuario).permit(:descripcion, :activo)
    end
end
