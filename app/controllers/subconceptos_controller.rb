class SubconceptosController < ApplicationController
  before_action :set_subconcepto, only: [:show, :update, :destroy]

  # GET /subconceptos
  def index
    @subconceptos = Subconcepto.all

    render json: @subconceptos
  end

  # GET /subconceptos/1
  def show
    render json: @subconcepto
  end

  # POST /subconceptos
  def create
    @subconcepto = Subconcepto.new(subconcepto_params)

    if @subconcepto.save
      render json: @subconcepto, status: :created, location: @subconcepto
    else
      render json: @subconcepto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subconceptos/1
  def update
    if @subconcepto.update(subconcepto_params)
      render json: @subconcepto
    else
      render json: @subconcepto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subconceptos/1
  def destroy
    @subconcepto.destroy
  end

  def getsubconceptobyconcepto
    @subconceptos = Subconcepto.where(concepto_id:params[:concepto_id])
    render json: @subconceptos
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subconcepto
      @subconcepto = Subconcepto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subconcepto_params
      params.require(:subconcepto).permit(:descripcion, :activo, :concepto_id)
    end
end
