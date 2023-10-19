class CajamensualesController < ApplicationController
  before_action :set_cajamensual, only: [:show, :update, :destroy]

  # GET /cajamensuales
  def index
    @cajamensuales = Cajamensual.all

    render json: @cajamensuales
  end

  # GET /cajamensuales/1
  def show
    render json: @cajamensual
  end

  # POST /cajamensuales
  def create
    @cajamensual = Cajamensual.new(cajamensual_params)

    if @cajamensual.save
      render json: @cajamensual, status: :created, location: @cajamensual
    else
      render json: @cajamensual.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cajamensuales/1
  def update
    if @cajamensual.update(cajamensual_params)
      render json: @cajamensual
    else
      render json: @cajamensual.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cajamensuales/1
  def destroy
    @cajamensual.destroy
  end

  def lastcierremensual      
      @cajamensual = Cajamensual.last
      render json: @cajamensual   
  end

  def getcajamensualbyperiodo
    periodo = params[:periodo]  
    @cajamensual = Cajamensual.where(periodo: periodo)                 
    render json: @cajamensual    
  end

  def getcajamensualbyanio   
    @cajamensual = Cajamensual.
                 where('cajamensuales.periodo  ILIKE ?', "%#{params[:anio]}").                    
                 order('cajamensuales.periodo ASC')              
    render json: @cajamensual
  end

  def getcajamensualbyperiodoant
    periodo = params[:periodo]  
    @cajamensual = Cajamensual.where(periodo: periodo)                 
    render json: @cajamensual    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cajamensual
      @cajamensual = Cajamensual.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cajamensual_params
      params.require(:cajamensual).permit(:periodo, :saldoinicial, :ingreso, :egreso, :saldocierre,:created_by_id,:updated_by_id)
    end
end
