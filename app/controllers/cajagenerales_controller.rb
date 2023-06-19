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
        @cajagenerales = Cajageneral.where("DATE(fecha) >= DATE(?)",fechadesde).where("DATE(fecha) <= DATE(?)", fechahasta).where(activo:true,concepto_id:concepto_id).order('cajagenerales.id ASC')  
    else
        if concepto_id != "null" && subconcepto_id != "null" && formapago_id == "null"
           @cajagenerales = Cajageneral.where("DATE(fecha) >= DATE(?)",fechadesde).where("DATE(fecha) <= DATE(?)", fechahasta).where(activo:true,concepto_id:concepto_id,subconcepto_id:subconcepto_id).order('cajagenerales.id ASC') 
        else
          if concepto_id != "null" && subconcepto_id != "null" && formapago_id != "null"
            @cajagenerales = Cajageneral.where("DATE(fecha) >= DATE(?)",fechadesde).where("DATE(fecha) <= DATE(?)", fechahasta).where(activo:true,concepto_id:concepto_id,subconcepto_id:subconcepto_id,formapago_id:formapago_id).order('cajagenerales.id ASC')  
          else
            if concepto_id == "null" && subconcepto_id == "null" && formapago_id != "null"
                @cajagenerales = Cajageneral.where("DATE(fecha) >= DATE(?)",fechadesde).where("DATE(fecha) <= DATE(?)", fechahasta).where(activo:true,formapago_id:formapago_id).order('cajagenerales.id ASC')
            else
                if concepto_id != "null" && subconcepto_id == "null" && formapago_id != "null"
                 @cajagenerales = Cajageneral.where("DATE(fecha) >= DATE(?)",fechadesde).where("DATE(fecha) <= DATE(?)", fechahasta).where(activo:true,concepto_id:concepto_id,formapago_id:formapago_id).order('cajagenerales.id ASC') 
                else
                 @cajagenerales = Cajageneral.where("DATE(fecha) >= DATE(?)",fechadesde).where("DATE(fecha) <= DATE(?)", fechahasta).where(activo:true).order('cajagenerales.id ASC')                      
                end 
            end 
          end 
        end    
    end  
    render json: @cajagenerales
  end 

  def updateregistrocanceled  
    cajageneral = Cajageneral.find(params[:id])
    if cajageneral
      @cajageneral = cajageneral.update(activo: false,canceled_by_id:params[:canceled_by_id], canceled_at:params[:canceled_at])
      render json: @cajageneral
    else
      render json: @cajageneral.errors, status: :unprocessable_entity
    end
  end

  def lastregistro      
      @cajageneral = Cajageneral.where(activo: true).last
      render json: @cajageneral   
  end

  def sumregistros      
      registro = []
      ingreso = Cajageneral.where(activo: true,tiporegistro_id:1).sum(:importe)
      egreso = Cajageneral.where(activo: true,tiporegistro_id:2).sum(:importe)
      neto = ingreso - egreso
      registro.push({ingreso:ingreso,egreso:egreso, neto: neto})
      render json: registro
  end

  def getregistroscajabyrangomes # todavia no usado
     cajamensual = []
     fechahasta = Date.parse(params[:fechahasta]).strftime "%Y-%m"
     ingreso = Cajageneral.where("to_char(cajagenerales.fecha, 'YYYY-MM') = ?",fechahasta).where(activo: true,tiporegistro_id:1).sum(:importe)
     egreso = Cajageneral.where("to_char(cajagenerales.fecha, 'YYYY-MM') = ?",fechahasta).where(activo: true,tiporegistro_id:2).sum(:importe)
     neto = ingreso - egreso
     cajamensual.push({ingreso:ingreso,egreso:egreso, neto: neto})
     render json: cajamensual
  end  

  def updateregistroscajabymes
    registros = Cajageneral.where(id: params[:registroids])   
    @registros = registros.update(registrocerrado: true, updated_by_id: params[:usuario_id])
    render json: @registros
  end  

  def getlastrecibointerno
      @cajageneral = Cajageneral.where(tipocomprobante_id:params[:comprobante_id],activo: true).last
      render json: @cajageneral   
  end

  def agrupadosbysubconcepto
    anio = params[:anio]
    @detalles = Cajageneral.select("cajagenerales.tiporegistro_id,cajagenerales.concepto_id,cajagenerales.subconcepto_id, sum(cajagenerales.importe) as suma").                     
                            where("to_char(cajagenerales.fecha, 'YYYY') = ?",anio).
                            where("cajagenerales.activo=?",true).
                            where("cajagenerales.registrocerrado=?",true). 
                            group("cajagenerales.tiporegistro_id").                               
                            group("cajagenerales.concepto_id").
                            group("cajagenerales.subconcepto_id").
                            order("cajagenerales.concepto_id")                   
    render json: @detalles, each_serializer: RegistrosagrupadosSerializer
  end 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cajageneral
      @cajageneral = Cajageneral.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cajageneral_params
      params.require(:cajageneral).permit(:fecha, :tiporegistro_id, :concepto_id, :subconcepto_id, :tipocomprobante_id, :nrocomprobante, :nroordenpago, :proveedor_id, :formapago_id, :importe, :observacion, :activo, :created_by_id, :updated_by_id, :saldo, :registrocerrado)
    end
end
