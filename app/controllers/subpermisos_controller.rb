class SubpermisosController < ApplicationController
  before_action :set_subpermiso, only: [:show, :update, :destroy]

  # GET /subpermisos
  def index
    @subpermisos = Subpermiso.all

    render json: @subpermisos
  end

  # GET /subpermisos/1
  def show
    render json: @subpermiso
  end

  # POST /subpermisos
  def create
    @subpermiso = Subpermiso.new(subpermiso_params)

    if @subpermiso.save
      render json: @subpermiso, status: :created, location: @subpermiso
    else
      render json: @subpermiso.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subpermisos/1
  def update
    if @subpermiso.update(subpermiso_params)
      render json: @subpermiso
    else
      render json: @subpermiso.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subpermisos/1
  def destroy
    @subpermiso.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subpermiso
      @subpermiso = Subpermiso.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subpermiso_params
      params.require(:subpermiso).permit(:url, :descripcion, :opcion, :icono, :activo, :permiso_id)
    end
end
