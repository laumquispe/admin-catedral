class CajageneralesController < ApplicationController
  before_action :set_cajageneral, only: [:show, :update, :destroy]

  # GET /cajagenerales
  def index
    @cajagenerales = Cajageneral.all

    render json: @cajagenerales
  end

  # GET /cajagenerales/1
  def show
    render json: @cajageneral
  end

  # POST /cajagenerales
  def create
    @cajageneral = Cajageneral.new(cajageneral_params)

    if @cajageneral.save
      render json: @cajageneral, status: :created, location: @cajageneral
    else
      render json: @cajageneral.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cajagenerales/1
  def update
    if @cajageneral.update(cajageneral_params)
      render json: @cajageneral
    else
      render json: @cajageneral.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cajagenerales/1
  def destroy
    @cajageneral.destroy
  end

  def getregistroscajabyRangofecha
    fechadesde = Date.parse(params[:fechadesde]).strftime "%Y-%m-%d"
    fechahasta = Date.parse(params[:fechahasta]).strftime "%Y-%m-%d"
    concepto_id = params[:concepto_id]
    subconcepto_id = params[:subconcepto_id]
    formapago_id = params[:formapago_id]
    if concepto_id != "null" && subconcepto_id == "null" && formapago_id == "null"
        @cajagenerales = Cajageneral.where("DATE(fecha) >= DATE(?)",fechadesde).where("DATE(fecha) <= DATE(?)", fechahasta).where(activo:true,concepto_id:concepto_id).order('cajagenerales.id DESC')  
    else
        if concepto_id != "null" && subconcepto_id != "null" && formapago_id == "null"
           @cajagenerales = Cajageneral.where("DATE(fecha) >= DATE(?)",fechadesde).where("DATE(fecha) <= DATE(?)", fechahasta).where(activo:true,concepto_id:concepto_id,subconcepto_id:subconcepto_id).order('cajagenerales.id DESC') 
        else
          if concepto_id != "null" && subconcepto_id != "null" && formapago_id != "null"
            @cajagenerales = Cajageneral.where("DATE(fecha) >= DATE(?)",fechadesde).where("DATE(fecha) <= DATE(?)", fechahasta).where(activo:true,concepto_id:concepto_id,subconcepto_id:subconcepto_id,formapago_id:formapago_id).order('cajagenerales.id DESC')  
          else
            if concepto_id == "null" && subconcepto_id == "null" && formapago_id != "null"
                @cajagenerales = Cajageneral.where("DATE(fecha) >= DATE(?)",fechadesde).where("DATE(fecha) <= DATE(?)", fechahasta).where(activo:true,formapago_id:formapago_id).order('cajagenerales.id DESC')
            else
                if concepto_id != "null" && subconcepto_id == "null" && formapago_id != "null"
                 @cajagenerales = Cajageneral.where("DATE(fecha) >= DATE(?)",fechadesde).where("DATE(fecha) <= DATE(?)", fechahasta).where(activo:true,concepto_id:concepto_id,formapago_id:formapago_id).order('cajagenerales.id DESC') 
                else
                 @cajagenerales = Cajageneral.where("DATE(fecha) >= DATE(?)",fechadesde).where("DATE(fecha) <= DATE(?)", fechahasta).where(activo:true).order('cajagenerales.id DESC')                      
                end 
            end 
          end 
        end    
    end  
    render json: @cajagenerales
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cajageneral
      @cajageneral = Cajageneral.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cajageneral_params
      params.require(:cajageneral).permit(:fecha, :tiporegistro_id, :concepto_id, :subconcepto_id, :tipocomprobante_id, :nrocomprobante, :nroordenpago, :proveedor_id, :formapago_id, :importe, :observacion, :activo, :created_by_id, :updated_by_id)
    end
end
