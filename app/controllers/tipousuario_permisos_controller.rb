class TipousuarioPermisosController < ApplicationController
  before_action :set_tipousuario_permiso, only: [:show, :update, :destroy]

  # GET /tipousuario_permisos
  def index
    @tipousuario_permisos = TipousuarioPermiso.all

    render json: @tipousuario_permisos
  end

  # GET /tipousuario_permisos/1
  def show
    render json: @tipousuario_permiso
  end

  # POST /tipousuario_permisos
  def create
    @tipousuario_permiso = TipousuarioPermiso.new(tipousuario_permiso_params)

    if @tipousuario_permiso.save
      render json: @tipousuario_permiso, status: :created, location: @tipousuario_permiso
    else
      render json: @tipousuario_permiso.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipousuario_permisos/1
  def update
    if @tipousuario_permiso.update(tipousuario_permiso_params)
      render json: @tipousuario_permiso
    else
      render json: @tipousuario_permiso.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipousuario_permisos/1
  def destroy
    @tipousuario_permiso.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipousuario_permiso
      @tipousuario_permiso = TipousuarioPermiso.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipousuario_permiso_params
      params.require(:tipousuario_permiso).permit(:tipousuario_id, :permiso_id)
    end
end
