class ProveedoresController < ApplicationController
  before_action :set_proveedor, only: [:show, :update, :destroy]

  # GET /proveedores
  def index
    @proveedores = Proveedor.all

    render json: @proveedores
  end

  # GET /proveedores/1
  def show
    render json: @proveedor
  end

  # POST /proveedores
  def create
    @proveedor = Proveedor.new(proveedor_params)

    if @proveedor.save
      render json: @proveedor, status: :created, location: @proveedor
    else
      render json: @proveedor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /proveedores/1
  def update
    if @proveedor.update(proveedor_params)
      render json: @proveedor
    else
      render json: @proveedor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /proveedores/1
  def destroy
    @proveedor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proveedor
      @proveedor = Proveedor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def proveedor_params
      params.require(:proveedor).permit(:descripcion, :activo)
    end
end
