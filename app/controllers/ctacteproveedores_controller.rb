class CtacteproveedoresController < ApplicationController
  before_action :set_ctacteproveedor, only: [:show, :update, :destroy]

  # GET /ctacteproveedores
  def index
    @ctacteproveedores = Ctacteproveedor.all

    render json: @ctacteproveedores
  end

  # GET /ctacteproveedores/1
  def show
    render json: @ctacteproveedor
  end

  # POST /ctacteproveedores
  def create
    @ctacteproveedor = Ctacteproveedor.new(ctacteproveedor_params)

    if @ctacteproveedor.save
      render json: @ctacteproveedor, status: :created, location: @ctacteproveedor
    else
      render json: @ctacteproveedor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ctacteproveedores/1
  def update
    if @ctacteproveedor.update(ctacteproveedor_params)
      render json: @ctacteproveedor
    else
      render json: @ctacteproveedor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ctacteproveedores/1
  def destroy
    @ctacteproveedor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ctacteproveedor
      @ctacteproveedor = Ctacteproveedor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ctacteproveedor_params
      params.require(:ctacteproveedor).permit(:fecha, :proveedor_id, :numerofactura, :ingreso, :egreso, :activo)
    end
end
