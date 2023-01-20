class TipousuarioSubpermisosController < ApplicationController
  before_action :set_tipousuario_subpermiso, only: [:show, :update, :destroy]

  # GET /tipousuario_subpermisos
  def index
    @tipousuario_subpermisos = TipousuarioSubpermiso.all

    render json: @tipousuario_subpermisos
  end

  # GET /tipousuario_subpermisos/1
  def show
    render json: @tipousuario_subpermiso
  end

  # POST /tipousuario_subpermisos
  def create
    @tipousuario_subpermiso = TipousuarioSubpermiso.new(tipousuario_subpermiso_params)

    if @tipousuario_subpermiso.save
      render json: @tipousuario_subpermiso, status: :created, location: @tipousuario_subpermiso
    else
      render json: @tipousuario_subpermiso.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipousuario_subpermisos/1
  def update
    if @tipousuario_subpermiso.update(tipousuario_subpermiso_params)
      render json: @tipousuario_subpermiso
    else
      render json: @tipousuario_subpermiso.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipousuario_subpermisos/1
  def destroy
    @tipousuario_subpermiso.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipousuario_subpermiso
      @tipousuario_subpermiso = TipousuarioSubpermiso.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipousuario_subpermiso_params
      params.require(:tipousuario_subpermiso).permit(:tipousuario_id, :subpermiso_id)
    end
end
