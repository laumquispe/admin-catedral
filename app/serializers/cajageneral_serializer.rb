class CajageneralSerializer < ActiveModel::Serializer
  attributes :id, :fecha, :nrocomprobante, :nroordenpago, :importe, :observacion, :activo, :tiporegistro_id, :createdregistro,:tipocomprobante_id,
  :proveedor_id, :formapago_id
  :updatedregistro
  has_one :tiporegistro
  has_one :concepto
  has_one :subconcepto
  has_one :tipocomprobante
  has_one :formapago
  has_one :proveedor

  def createdregistro
    if !object.created_by.nil?
    'Creado por: '+object.created_by.nickname+' '+object.created_at.strftime("%d/%m/%Y %H:%M")
    end
  end  

  def updatedregistro
    if !object.updated_by.nil?
    'Actualizado por: '+object.updated_by.nickname+' '+object.updated_at.strftime("%d/%m/%Y %H:%M")
    end
  end  

  attribute :created_at do 
    object.created_at.strftime "%d/%m/%Y" 
  end

  attribute :importe do 
    object.importe.to_f
  end 

  
  attribute :fecha do 
    object.fecha.strftime "%d/%m/%Y" 
  end
end
